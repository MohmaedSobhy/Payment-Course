import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/utils/styles.dart';
import '../views/payment_details_view_body.dart';

class PaymentDetailsScreen extends StatelessWidget {
  const PaymentDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset('assets/images/arrow_back.svg'),
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Payment Details',
          style: Styles.textStyle25,
        ),
      ),
      body: const PaymentDetailsBodyView(),
    );
  }
}
