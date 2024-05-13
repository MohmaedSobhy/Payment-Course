import 'package:flutter/material.dart';
import 'package:flutter_stripe_payment/Feature/checkout/presentation/views/thank_you_view_body.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ThankYouScreen extends StatelessWidget {
  const ThankYouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Transform.translate(
        offset: const Offset(0, 0),
        child: const ThankYouViewBody(),
      ),
    );
  }
}

AppBar buildAppBar() {
  return AppBar(
    leading: Center(
      child: InkWell(
        onTap: () {},
        child: SvgPicture.asset('assets/images/arrow_back.svg'),
      ),
    ),
  );
}
