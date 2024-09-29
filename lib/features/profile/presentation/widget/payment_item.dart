import 'package:eco_sfera/core/assets/theme/app_colors.dart';
import 'package:eco_sfera/features/profile/data/model/payment_history.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PaymentItem extends StatelessWidget {
  final PaymentHistory paymentHistory;
  const PaymentItem({super.key, required this.paymentHistory});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    DateFormat('HH:mm').format(paymentHistory.date),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    paymentHistory.description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '-${paymentHistory.amount.abs().toStringAsFixed(2)} ',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.main,
                    ),
                  ),
                  TextSpan(
                    text: 'sum',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
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