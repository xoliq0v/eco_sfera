import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:model/model.dart';


class PaymentItem extends StatelessWidget {
  final Transaction paymentHistory;
  const PaymentItem({super.key, required this.paymentHistory});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  paymentHistory.type?.tr(context: context)??'',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  paymentHistory.user??'',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
            const Spacer(),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${double.parse(paymentHistory.amount??'').formattedWithSpaces} ',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: paymentHistory.type == 'income' ? AppColors.main : AppColors.red,
                    ),
                  ),
                  TextSpan(
                    text: LocaleKeys.sum.tr(context: context),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}