class PaymentIntentModel {
  String? id;
  String? object;

  String clientSecret;

  PaymentIntentModel({
    this.id,
    this.object,
    required this.clientSecret,
  });

  factory PaymentIntentModel.fromJson(Map<String, dynamic> json) {
    return PaymentIntentModel(
      id: json['id'] as String?,
      object: json['object'] as String?,
      clientSecret: json['client_secret'],
    );
  }
}
