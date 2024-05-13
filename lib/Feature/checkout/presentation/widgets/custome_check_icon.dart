import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';

class CustomeCheckIcon extends StatelessWidget {
  const CustomeCheckIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 40,
      backgroundColor: Color(0xffD9D9D9),
      child: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.green,
        child: Icon(
          FontAwesomeIcons.check,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }
}
