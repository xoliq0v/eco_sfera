
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class PaymentWithAccountNumber extends StatefulWidget {
  const PaymentWithAccountNumber({super.key});

  @override
  State<PaymentWithAccountNumber> createState() => _PaymentWithAccountNumberState();
}

class _PaymentWithAccountNumberState extends State<PaymentWithAccountNumber> {

  late TextEditingController accountNumberController;
  late TextEditingController amountController;

  @override
  void initState() {
    accountNumberController = TextEditingController();
    amountController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    accountNumberController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        20.verticalSpace,
        EcoTextField(
          topRightText: LocaleKeys.litsovoyShotNumberOfTheRecipient.tr(context: context),
          controller: accountNumberController,
        ),
        20.verticalSpace,
        EcoTextField(
          topRightText: LocaleKeys.amount.tr(context: context),
          controller: amountController,
        ),
        20.verticalSpace,
        EcoButton.min(
          onPressed: (){
            // BillingInformationSheet.show(
            //     context,
            //     {
            //       l10n.checkNumber: "681768746984265",
            //       l10n.calculated: "50 000",
            //       l10n.phoneNumber: "Joseph lilkhan",
            //       l10n.stir: "579461238",
            //       l10n.address: "Qalatoy",
            //       l10n.lastBalance: "2 518",
            //       l10n.payments: "50 000",
            //       l10n.time: "14.08.2024 14:43:25",
            //       l10n.organizationPhoneNumber: "+998 48 321 65 89",
            //       l10n.nameOfTheOrganization: "Eko sfera MChJ",
            //       l10n.organizationAddress: "Baxmal tumani",
            //       l10n.branchName: "Бахмалбский район",
            //     }
            // );
          },
          backgroundColor: colorScheme.background,
          borderRadius: 40,
          border: Border.all(
            color: colorScheme.secondary,
            width: 2
          ),
          child: Text(
              LocaleKeys.billingInformation.tr(context: context),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: colorScheme.secondary,
              fontSize: 12
            ),
          ),
        ),
        const Expanded(child: SizedBox.shrink()),
        EcoButton(
          onPressed: (){
            // LoadingDialog.show(context);
            Future.delayed(const Duration(seconds: 3),(){
              Navigator.of(context).pop();
              // SuccessPaymentDialog.show(context);
            });
          },
          borderRadius: 35,
          height: 60,
          width: MediaQuery.sizeOf(context).width * 0.9,
          child: Text(LocaleKeys.confirmation.tr(context: context)),
        ),
        25.verticalSpacingRadius
      ],
    );
  }
}
