import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CustomeCreditCard extends StatefulWidget {
  const CustomeCreditCard({super.key});

  @override
  State<CustomeCreditCard> createState() => _CustomeCreditCardState();
}

class _CustomeCreditCardState extends State<CustomeCreditCard> {
  String cardNumber = '', expiryDate = '', cardHolderName = '', cvvCode = '';
  bool showBackView = false;
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCardWidget(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            isHolderNameVisible: true,
            showBackView: showBackView,
            onCreditCardWidgetChange: (value) {}),
        CreditCardForm(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            onCreditCardModelChange: (cardModel) {
              cardNumber = cardModel.cardNumber;
              expiryDate = cardModel.expiryDate;
              cardHolderName = cardModel.cardHolderName;
              cvvCode = cardModel.cvvCode;
              showBackView = false;
              setState(() {});
            },
            formKey: formKey)
      ],
    );
  }
}
