import 'package:flutter_stripe_payment/Feature/checkout/data/model/item_list/item.dart';

class ItemListModel {
  List<OrderItemModel> orders;

  ItemListModel({required this.orders});

  Map<String, dynamic> toJson() => {
        'items': orders.map((e) => e.toJson()).toList(),
      };
}
