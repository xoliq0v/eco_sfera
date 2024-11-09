
import 'dart:developer';

import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PaymentWithCardPage extends StatefulWidget {
  const PaymentWithCardPage({super.key});

  @override
  State<PaymentWithCardPage> createState() => _PaymentWithCardPageState();
}

class _PaymentWithCardPageState extends State<PaymentWithCardPage> {

  late TextEditingController cardNumberController;
  late TextEditingController amountController;
  bool _isValid = false;
  String? _cardType;
  final Map<String, RegExp> uzbekCardPatterns = {
    'UzCard': RegExp(r'^8600[0-9]{12}$'),
    'Humo': RegExp(r'^9860[0-9]{12}$'),
    'Visa (Uzbekistan)': RegExp(r'^4[0-9]{12}(?:[0-9]{3})?$'),
    'MasterCard (Uzbekistan)': RegExp(r'^5[1-5][0-9]{14}$'),
    'UnionPay (Uzbekistan)': RegExp(r'^62[0-9]{14,17}$'),
  };

  @override
  void initState() {
    super.initState();
    amountController = TextEditingController();
    cardNumberController = TextEditingController();
    cardNumberController.addListener(_onCardNumberChanged);
  }

  void _onCardNumberChanged() {
    final cardNumber = cardNumberController.text.replaceAll(' ', '');
    setState(() {
      _cardType = _getCardType(cardNumber);
      _isValid = _validateCard(cardNumber);
    });
    // widget.onCardNumberChanged?.call(cardNumber);
    // widget.onCardTypeChanged?.call(_cardType);
    log('CARD NUMBER: $cardNumber');
    log('CARD TYPE: $_cardType');
  }

  String? _getCardType(String cardNumber) {
    for (var entry in uzbekCardPatterns.entries) {
      if (entry.value.hasMatch(cardNumber)) {
        return entry.key;
      }
    }
    return null;
  }

  bool _validateCard(String cardNumber) {
    return uzbekCardPatterns.values.any((pattern) => pattern.hasMatch(cardNumber));
  }


  @override
  void dispose() {
    cardNumberController.removeListener(_onCardNumberChanged);
    cardNumberController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        40.verticalSpace,
        EcoTextField(
          topRightText: LocaleKeys.recipientsCardNumber.tr(context: context),
          controller: cardNumberController,
          svgSuffixIcon: AppIcons.scan,
          hintText: 'xxxx  xxxx  xxxx  xxxx',
          svgSuffixIconPressed: () async{
            // var cardDetails = await CardScanner.scanCard();
            // if(cardDetails!=null){
            //   cardNumberController.text = cardDetails.cardNumber;
            // }
          },
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(16),
            // CreditCardFormatter(),
          ],
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a card number';
            }
            if (value.replaceAll(RegExp(r'\s+\b|\b\s'), '').length < 16) {
              return 'Please enter a valid 16-digit card number';
            }
            return null;
          },
          onChanged: (value) {
            if (value != null) {
            //   onChanged!(value.replaceAll(RegExp(r'\s+\b|\b\s'), ''));
              value.replaceAll(RegExp(r'\s+\b|\b\s'), '');
            }
          },
        ),
        20.verticalSpace,
        EcoTextField(
          topRightText: LocaleKeys.amount.tr(context: context),
          controller: amountController,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
        ),
        const Spacer(),
        EcoButton(
            onPressed: (){
              LoadingDialog.show(context);
              Future.delayed(const Duration(seconds: 3),(){
                context.router.popForced();
                SuccessPaymentDialog.show(context);
              });
            },
          borderRadius: 35,
          height: 60,
            child: Text(LocaleKeys.confirmation.tr(context: context)),
        ),
        25.verticalSpace
      ],
    );
  }
}
