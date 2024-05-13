import 'package:dartz/dartz.dart';
import 'package:flutter_stripe_payment/Feature/checkout/data/model/payment_intent_input.dart';
import 'package:flutter_stripe_payment/Feature/checkout/data/repository/check_out_repo.dart';
import 'package:flutter_stripe_payment/core/utils/stripe_servise.dart';

class CheckOutRepositroyImplmentation extends CheckOutRepository {
  static CheckOutRepositroyImplmentation? checkRepoImplment;

  CheckOutRepositroyImplmentation.privateConstructor();
  static CheckOutRepositroyImplmentation init() {
    checkRepoImplment ??= CheckOutRepositroyImplmentation.privateConstructor();
    return checkRepoImplment!;
  }

  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await StripeServies.makePayment(
          paymentIntentInput: paymentIntentInputModel);
      return right(null);
    } catch (error) {
      return left(Failure(errorMessage: error.toString()));
    }
  }
}
