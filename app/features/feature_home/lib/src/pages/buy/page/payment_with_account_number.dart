
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
            BillingInformationSheet.show(
                context,
                {
                  LocaleKeys.checkNumber: "681768746984265",
                  LocaleKeys.calculated: "50 000",
                  LocaleKeys.phoneNumber: "Joseph lilkhan",
                  LocaleKeys.stir: "579461238",
                  LocaleKeys.address: "Qalatoy",
                  LocaleKeys.lastBalance: "2 518",
                  LocaleKeys.payments: "50 000",
                  LocaleKeys.time: "14.08.2024 14:43:25",
                  LocaleKeys.organizationPhoneNumber: "+998 48 321 65 89",
                  LocaleKeys.nameOfTheOrganization: "Eko sfera MChJ",
                  LocaleKeys.organizationAddress: "Baxmal tumani",
                  LocaleKeys.branchName: "Бахмалбский район",
                }
            );
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
            LoadingDialog.show(context);
            Future.delayed(const Duration(seconds: 3),() {
              if (context.router.canPop()) context.router.popForced();
              SuccessPaymentDialog.show(context);
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
