import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/styles.dart';
import '../views/my_cart_view_body.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: InkWell(
            onTap: () {},
            child: SvgPicture.asset('assets/images/arrow_back.svg'),
          ),
        ),
        centerTitle: true,
        title: const Text(
          'My Cart',
          style: Styles.textStyle25,
        ),
      ),
      body: const MyCartViewBody(),
    );
  }
}
