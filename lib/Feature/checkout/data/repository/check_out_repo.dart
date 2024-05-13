import 'package:dartz/dartz.dart';
import 'package:flutter_stripe_payment/Feature/checkout/data/model/payment_intent_input.dart';

abstract class CheckOutRepository {
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel});
}

class Failure {
  final String errorMessage;
  Failure({required this.errorMessage});
}
