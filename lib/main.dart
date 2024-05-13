import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter_stripe_payment/core/api/api_keys.dart';
import 'package:flutter_stripe_payment/core/api/dio_helper.dart';

import 'payment_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();
  Stripe.publishableKey = ApiKeys.publishableKey;
  runApp(const PaymentApp());
}
