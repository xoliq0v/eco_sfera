// import 'package:core/core.dart';
// import 'package:design_system/design_system.dart';
// import 'package:flutter/material.dart';
// import 'package:model/model.dart';


// class PaymentItem extends StatelessWidget {
//   final Transaction paymentHistory;
//   const PaymentItem({super.key, required this.paymentHistory});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 50,
//       width: double.maxFinite,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   paymentHistory.type?.tr(context: context)??'',
//                   style: Theme.of(context).textTheme.bodyMedium,
//                 ),
//                 Text(
//                   paymentHistory.user??'',
//                   style: Theme.of(context).textTheme.headlineSmall,
//                 ),
//               ],
//             ),
//             const Spacer(),
//             RichText(
//               text: TextSpan(
//                 children: [
//                   TextSpan(
//                     text: '${double.parse(paymentHistory.amount??'').formattedWithSpaces} ',
//                     style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                       color: paymentHistory.type == 'income' ? AppColors.main : AppColors.red,
//                     ),
//                   ),
//                   TextSpan(
//                     text: LocaleKeys.sum.tr(context: context),
//                     style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                       color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    paymentHistory.type?.tr(context: context) ?? '',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    paymentHistory.user ?? '',
                    style: Theme.of(context).textTheme.headlineSmall,
                    overflow: TextOverflow.ellipsis, // Ensures text doesn't overflow
                    maxLines: 1, // Limits text to a single line
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10), // Adds some spacing between the user text and the amount
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${double.parse(paymentHistory.amount ?? '').formattedWithSpaces} ',
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