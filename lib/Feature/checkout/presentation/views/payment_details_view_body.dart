import 'package:flutter/material.dart';
import 'package:flutter_stripe_payment/core/widgets/custome_button.dart';

import '../screens/thank_you_screen.dart';
import 'custome_crediat_card.dart';
import 'payment_methods.dart';

class PaymentDetailsBodyView extends StatelessWidget {
  const PaymentDetailsBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(context).width * 0.02,
      ),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: Padding(
                padding: EdgeInsets.only(
                  top: 18,
                ),
                child: PaymentMethodsListView()),
          ),
          const SliverToBoxAdapter(
            child: CustomeCreditCard(),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                child: CustomeButton(
                  title: 'Payment',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return const ThankYouScreen();
                      }),
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
