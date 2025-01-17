
import 'dart:developer';

import 'package:app_bloc/app_bloc.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:model/model.dart';
import 'package:navigation/navigation.dart';

import '../../../../feature_home.dart';
import '../../auth/auth_screen.dart';

@RoutePage()
class PaymentWithCardPage extends StatefulWidget implements AutoRouteWrapper {
  final BuyReq params;
  const PaymentWithCardPage({super.key,required this.params});

  @override
  State<PaymentWithCardPage> createState() => _PaymentWithCardPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<BuyCubit>(
      create: (context) => AppBlocHelper.getBuyCubit(),
      child: this,
    );
  }
}

class _PaymentWithCardPageState extends State<PaymentWithCardPage> {

  late TextEditingController cardNumberController;
  late TextEditingController amountController;
  ValueNotifier<bool> isLoading = ValueNotifier(false);
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
    amountController.text = widget.params.totalPrice.toInt().sumFormat();
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
    return Material(
      child: BlocListener<BuyCubit,BuyState>(
        listener: (BuildContext context, state) {
          state.mapOrNull(
            error: (value) async {
                isLoading.value = false;
                // showAboutDialog(
                //     context: context,
                //     applicationName: 'EkoSfera',
                //     applicationLegalese: 'beta',
                //     applicationVersion: '1.0.0',
                //     applicationIcon: SizedBox(width: 50,height: 50, child: Image.asset(AppIcons.appLogoImage)),
                // );
              await showDialog(
                  context: context,
                  builder: (context) { return AlertDialog(title: Text(value.error.toString()),); }
              );
            },
            buyLoading: (value) {
              isLoading.value = true;
            },
            buySuccess: (value) async {
              // First close the loading dialog
              isLoading.value = false;
              context.router.popUntilRouteWithName(MainRoute.name);
              BillingInformationSheet.show(
                  context,
                  {
                    LocaleKeys.checkNumber: value.check.checkNumber,
                    LocaleKeys.payments: value.check.amount.toString(),
                    LocaleKeys.phoneNumber: value.check.payerPhoneNumber??'NULL',
                    LocaleKeys.stir: value.check.stir,
                    LocaleKeys.address: value.check.address ?? 'NULL',
                    // LocaleKeys.lastBalance: value.check.,
                    LocaleKeys.time: value.check.date,
                    LocaleKeys.organizationPhoneNumber: value.check.organizationPhoneNumber,
                    LocaleKeys.nameOfTheOrganization: value.check.organizationName,
                    LocaleKeys.organizationAddress: value.check.organizationAddress,
                    LocaleKeys.branchName: value.check.branchName,
                  }
              );
            },
          );
        },
        child: Column(
          children: [
            40.verticalSpace,
            // EcoTextField(
            //   topRightText: LocaleKeys.recipientsCardNumber.tr(context: context),
            //   controller: cardNumberController,
            //   svgSuffixIcon: AppIcons.scan,
            //   hintText: 'xxxx  xxxx  xxxx  xxxx',
            //   svgSuffixIconPressed: () async{
            //     // var cardDetails = await CardScanner.scanCard();
            //     // if(cardDetails!=null){
            //     //   cardNumberController.text = cardDetails.cardNumber;
            //     // }
            //   },
            //   keyboardType: TextInputType.number,
            //   inputFormatters: [
            //     FilteringTextInputFormatter.digitsOnly,
            //     LengthLimitingTextInputFormatter(16),
            //     // CreditCardFormatter(),
            //   ],
            //   validator: (value) {
            //     if (value == null || value.isEmpty) {
            //       return 'Please enter a card number';
            //     }
            //     if (value.replaceAll(RegExp(r'\s+\b|\b\s'), '').length < 16) {
            //       return 'Please enter a valid 16-digit card number';
            //     }
            //     return null;
            //   },
            //   onChanged: (value) {
            //     if (value != null) {
            //     //   onChanged!(value.replaceAll(RegExp(r'\s+\b|\b\s'), ''));
            //       value.replaceAll(RegExp(r'\s+\b|\b\s'), '');
            //     }
            //   },
            // ),
            EcoTextField(
              readOnly: true,
              topRightText: LocaleKeys.amount.tr(context: context),
              controller: amountController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
            const Spacer(),
            ValueListenableBuilder(
              valueListenable: isLoading,
              builder: (context,p1,p2) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: EcoElevatedButton.loading(
                    loading: isLoading.value,
                      onPressed: () async{
                        await context.read<BuyCubit>().buy(widget.params);
                      },
                      child: Text(LocaleKeys.confirmation.tr(context: context)),
                  ),
                );
              }
            ),
            25.verticalSpace
          ],
        ),
      ),
    );
  }
}
