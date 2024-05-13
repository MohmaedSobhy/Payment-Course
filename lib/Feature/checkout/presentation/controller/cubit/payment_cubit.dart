import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe_payment/Feature/checkout/data/model/payment_intent_input.dart';
import 'package:flutter_stripe_payment/Feature/checkout/data/repository/check_out_repo_implmentation.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());

  static PaymentCubit get(context) {
    return BlocProvider.of(context);
  }

  Future<void> makePayment(
      {required PaymentIntentInputModel paymentInput}) async {
    emit(PaymentLoading());

    try {
      var date = await CheckOutRepositroyImplmentation.init()
          .makePayment(paymentIntentInputModel: paymentInput);
      date.fold((fail) {
        emit(PaymentFailure(errorMessage: fail.errorMessage));
      }, (success) {
        emit(PaymentSuccess());
      });
    } catch (error) {
      log(error.toString());
      emit(PaymentFailure(errorMessage: error.toString()));
    }
  }

  @override
  void onChange(Change<PaymentState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
