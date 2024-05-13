import 'package:flutter/material.dart';
import 'package:flutter_stripe_payment/core/widgets/custome_button.dart';

import '../widgets/order_info_item.dart';
import '../widgets/total_price.dart';
import 'model_bottom_sheet.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.05),
      child: Column(
        children: [
          Expanded(
            child: Image.asset('assets/images/basket.png'),
          ),
          const OrderInfoItem(title: 'Order Subtotal', value: '\$42.97'),
          const OrderInfoItem(title: 'Discount', value: '\$0'),
          const OrderInfoItem(title: 'Shipping', value: '\$8'),
          const Divider(
            thickness: 2,
            color: Colors.grey,
            indent: 2,
            endIndent: 2,
          ),
          const TotalPrice(totalPrice: 50.97),
          const SizedBox(height: 5),
          CustomeButton(
            title: 'Complete Payment',
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return const PaymentMethodesModelBottomSheet();
                  });
            },
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
