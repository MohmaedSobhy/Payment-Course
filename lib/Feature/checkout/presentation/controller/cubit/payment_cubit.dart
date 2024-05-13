import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:flutter_stripe_payment/Feature/checkout/data/model/amount_model/amount.dart';
import 'package:flutter_stripe_payment/Feature/checkout/data/model/item_list/item_list.dart';
import 'package:flutter_stripe_payment/Feature/checkout/data/model/payment_intent_input.dart';
import 'package:flutter_stripe_payment/Feature/checkout/data/repository/check_out_repo_implmentation.dart';
import 'package:flutter_stripe_payment/core/api/api_keys.dart';

import '../../../data/model/amount_model/details.dart';
import '../../../data/model/item_list/item.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());

  final bool isPaypal = true;
  static PaymentCubit get(context) {
    return BlocProvider.of(context);
  }

  Future<void> makePayment(
      {required PaymentIntentInputModel paymentInput}) async {
    emit(PaymentLoading());

    try {
      var date = await CheckOutRepositroyImplmentation.init()
          .makePayment(paymentIntentInputModel: paymentInput);
      date.fold((fail) {
        emit(PaymentFailure(errorMessage: fail.errorMessage));
      }, (success) {
        emit(PaymentSuccess());
      });
    } catch (error) {
      log(error.toString());
      emit(PaymentFailure(errorMessage: error.toString()));
    }
  }

  void makePaypalPyment(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return PaypalCheckoutView(
        sandboxMode: true,
        clientId: ApiKeys.payPalClientId,
        secretKey: ApiKeys.paypalSecretKey,
        transactions: [
          {
            "amount": {
              "total": "100",
              "currency": "USD",
              "details": {
                "subtotal": '100',
                "shipping": '0',
                "shipping_discount": 0
              }
            },
            "description": "The payment transaction description.",
            "item_list": {
              "items": [
                {
                  "name": "Apple",
                  "quantity": 4,
                  "price": "10",
                  "currency": "USD"
                },
                {
                  "name": "Pineapple",
                  "quantity": 5,
                  "price": "12",
                  "currency": "USD"
                }
              ],
            }
          }
        ],
        onSuccess: (Map params) async {
          emit(PaymentSuccess());
        },
        onError: (error) {
          log(error.toString());
          emit(PaymentFailure(errorMessage: error.toString()));
        },
        onCancel: () {},
      );
    }));
  }

  @override
  void onChange(Change<PaymentState> change) {
    log(change.toString());
    super.onChange(change);
  }

  AmountModel getAmount() {
    return AmountModel(
        total: "100",
        currency: 'USD',
        details: Details(shipping: "0", shippingDiscount: 0, subtotal: "100"));
  }

  ItemListModel getItemList() {
    var list = [
      OrderItemModel(
        currency: 'USD',
        name: 'Apple',
        price: "4",
        quantity: 10,
      ),
      OrderItemModel(
        currency: 'USD',
        name: 'Apple',
        price: "5",
        quantity: 12,
      ),
    ];
    return ItemListModel(orders: list);
  }
}
