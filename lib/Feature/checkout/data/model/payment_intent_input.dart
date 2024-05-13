class PaymentIntentInputModel {
  final String currency;
  final int amount;

  PaymentIntentInputModel({required this.amount, required this.currency});

  toJson() {
    return {'amount': (amount * 100).toString(), 'currency': currency};
  }
}
