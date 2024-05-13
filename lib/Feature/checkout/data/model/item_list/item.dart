class OrderItem {
  String? name;
  String? quantity;
  String? price;
  String? currency;

  OrderItem({this.name, this.quantity, this.price, this.currency});

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        name: json['name'] as String?,
        quantity: json['quantity'] as String?,
        price: json['price'] as String?,
        currency: json['currency'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'quantity': quantity,
        'price': price,
        'currency': currency,
      };
}
