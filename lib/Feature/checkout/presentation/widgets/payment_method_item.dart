import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentMethodItem extends StatelessWidget {
  final bool isActive;
  final String image;
  const PaymentMethodItem(
      {super.key, this.isActive = false, required this.image});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 300),
      width: 103,
      height: 62,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
                width: 1.50, color: isActive ? Colors.green : Colors.grey),
            boxShadow: [
              BoxShadow(
                color: isActive ? Colors.green : Colors.white,
                blurRadius: 4,
                offset: const Offset(0, 0),
                spreadRadius: 0,
              )
            ]),
        child: Center(
          child: SvgPicture.asset(
            image,
            height: 30,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}
