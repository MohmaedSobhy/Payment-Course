import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe_payment/Feature/checkout/data/model/payment_intent_input.dart';
import 'package:flutter_stripe_payment/Feature/checkout/presentation/screens/thank_you_screen.dart';
import 'package:flutter_stripe_payment/Feature/checkout/presentation/views/payment_methods.dart';
import '../../../../core/widgets/custome_button.dart';
import '../controller/cubit/payment_cubit.dart';

class PaymentMethodesModelBottomSheet extends StatelessWidget {
  const PaymentMethodesModelBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentCubit(),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: BlocConsumer<PaymentCubit, PaymentState>(
          listener: (context, state) {
            if (state is PaymentSuccess) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return const ThankYouScreen();
              }));
            }
          },
          builder: (context, state) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                const PaymentMethodsListView(),
                const SizedBox(
                  height: 32,
                ),
                CustomeButton(
                  title: 'Continue',
                  onTap: () async {
                    if (PaymentCubit.get(context).isPaypal) {
                      PaymentCubit.get(context).makePaypalPyment(context);
                    } else {
                      await PaymentCubit.get(context).makePayment(
                          paymentInput: PaymentIntentInputModel(
                              amount: 100, currency: 'usd'));
                    }
                  },
                  isLoading: state is PaymentLoading,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
