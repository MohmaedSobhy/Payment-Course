import 'package:flutter/material.dart';

import '../utils/styles.dart';

class CustomeButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isLoading;
  const CustomeButton(
      {super.key,
      required this.title,
      required this.onTap,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      color: const Color(0xff34A853),
      minWidth: double.infinity,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: (isLoading)
            ? const CircularProgressIndicator(
                color: Colors.white,
              )
            : Text(
                title,
                style: Styles.textStyle22,
              ),
      ),
    );
  }
}
