import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter_stripe_payment/Feature/checkout/data/model/payment_intent_input.dart';
import 'package:flutter_stripe_payment/Feature/checkout/data/model/payment_intent_model/payment_intent_model.dart';
import 'package:flutter_stripe_payment/core/api/dio_helper.dart';
import '../api/api_keys.dart';

abstract class StripeServies {
  static Future<void> makePayment(
      {required PaymentIntentInputModel paymentIntentInput}) async {
    try {
      PaymentIntentModel paymentIntent =
          await _createPaymentIntent(paymentIntentInput);
      await _initializePaymentSheet(paymentIntent.clientSecret);
      await Stripe.instance.presentPaymentSheet();
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  static Future<void> _initializePaymentSheet(String clientSecret) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecret,
        merchantDisplayName: "Mohamed Sobhy",
      ),
    );
  }

  static Future<PaymentIntentModel> _createPaymentIntent(
      PaymentIntentInputModel paymentInput) async {
    var response = await DioHelper.postData(
      url: 'https://api.stripe.com/v1/payment_intents',
      token: ApiKeys.secretKey,
      body: paymentInput.toJson(),
    );
    return PaymentIntentModel.fromJson(response.data);
  }
}
