import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';

class TotalPrice extends StatelessWidget {
  final double totalPrice;
  const TotalPrice({super.key, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Total',
          style: Styles.textStyle24,
        ),
        Spacer(),
        Text(
          '\$$totalPrice',
          style: Styles.textStyle24,
        ),
      ],
    );
  }
}
