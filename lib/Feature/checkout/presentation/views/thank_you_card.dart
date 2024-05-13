import 'package:flutter/material.dart';
import 'package:flutter_stripe_payment/Feature/checkout/presentation/widgets/order_info_item.dart';
import 'package:flutter_stripe_payment/core/utils/styles.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';

import '../widgets/card_info_widget.dart';
import '../widgets/total_price.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xffD9D9D9),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.only(top: 50 + 16, left: 22, right: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Thank you!',
            style: Styles.textStyle25,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Your transaction was successful',
            style: Styles.textStyle20
                .copyWith(color: Colors.black.withOpacity(0.8)),
          ),
          const SizedBox(
            height: 42,
          ),
          const OrderInfoItem(
            title: 'Date',
            value: '01/24/2023',
          ),
          const SizedBox(
            height: 20,
          ),
          const OrderInfoItem(
            title: 'Time',
            value: '10:15 AM',
          ),
          const SizedBox(
            height: 20,
          ),
          const OrderInfoItem(
            title: 'To',
            value: 'Mohamed Sobhy',
          ),
          const Divider(
            height: 60,
            thickness: 2,
          ),
          const TotalPrice(
            totalPrice: 50.97,
          ),
          const SizedBox(
            height: 20,
          ),
          const CardInfoWidget(),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                FontAwesomeIcons.barcode,
                size: 64,
              ),
              Container(
                width: 113,
                height: 58,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side:
                        const BorderSide(width: 1.50, color: Color(0xFF34A853)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Center(
                  child: Text(
                    'PAID',
                    textAlign: TextAlign.center,
                    style: Styles.textStyle24
                        .copyWith(color: const Color(0xff34A853)),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: ((MediaQuery.sizeOf(context).height * 0.2) / 2) - 29,
          ),
        ],
      ),
    );
  }
}
