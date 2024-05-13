import 'package:flutter/material.dart';

class CustomeDashedLine extends StatelessWidget {
  const CustomeDashedLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(15, (index) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Container(
              height: 2,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 191, 191, 191),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
        );
      }),
    );
  }
}
