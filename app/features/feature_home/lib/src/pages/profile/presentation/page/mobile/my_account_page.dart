

import 'package:core/core.dart';
import 'package:design_system/design_system.dart' hide AppImage;
import 'package:flutter/material.dart';

import '../../../data/model/payment_history.dart';
import '../../widget/payment_item.dart';

@RoutePage()
class MyAccountPage extends StatefulWidget {
  const MyAccountPage({super.key});

  @override
  State<MyAccountPage> createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {

  List<PaymentHistory> getTestPaymentHistory() {
    return [
      PaymentHistory(
        date: DateTime(2024, 9, 17, 14, 30),
        description: "Grocery shopping",
        amount: -50000,
      ),
      PaymentHistory(
        date: DateTime(2024, 9, 17, 18, 45),
        description: "Salary deposit",
        amount: 1500000,
      ),
      PaymentHistory(
        date: DateTime(2024, 9, 16, 10, 15),
        description: "Coffee shop",
        amount: -15000,
      ),
      PaymentHistory(
        date: DateTime(2024, 9, 16, 13, 20),
        description: "Online purchase",
        amount: -75000,
      ),
      PaymentHistory(
        date: DateTime(2024, 9, 15, 9, 0),
        description: "Transport fare",
        amount: -10000,
      ),
      PaymentHistory(
        date: DateTime(2024, 9, 15, 20, 30),
        description: "Restaurant dinner",
        amount: -120000,
      ),
      PaymentHistory(
        date: DateTime(2024, 9, 14, 11, 45),
        description: "Freelance payment",
        amount: 500000,
      ),
      PaymentHistory(
        date: DateTime(2024, 9, 13, 16, 0),
        description: "Utility bill",
        amount: -80000,
      ),
      PaymentHistory(
        date: DateTime(2024, 9, 12, 14, 30),
        description: "Book purchase",
        amount: -25000,
      ),
      PaymentHistory(
        date: DateTime(2024, 9, 11, 9, 15),
        description: "Gym membership",
        amount: -100000,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {

    final sortedPayments = getTestPaymentHistory()..sort((a, b) => b.date.compareTo(a.date));

    final groupedPayments = <DateTime, List<PaymentHistory>>{};
    for (var payment in sortedPayments) {
      final date = DateTime(payment.date.year, payment.date.month, payment.date.day);
      groupedPayments.putIfAbsent(date, () => []).add(payment);
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        surfaceTintColor: context.colorScheme.surface,
        // backgroundColor: Theme.of(context).primaryColor,
        title: Text(LocaleKeys.myAccount.tr(context: context)),
        scrolledUnderElevation: 4,
        elevation: 4,
      ),
      body: CustomScrollView(
        slivers: [
          30.verticalSpace.toBoxAdapter(),
          Stack(
            alignment: Alignment.centerLeft,
            children: [
              Align(alignment: Alignment.center,child: SvgPicture.asset(AppIcons.cardImage)),
              SizedBox(
                height: 170,
                width: double.maxFinite,
                child: Padding(
                  padding: const EdgeInsets.only(left: 38.0,top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('lorem ipsum',style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),),
                      Text('100,000sum',style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 20),),
                      const Spacer(),
                      Text('lorem ipsum',style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),),
                    ],
                  ),
                ),
              )
            ],
          ).toBoxAdapter(),
          30.verticalSpace.toBoxAdapter(),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
                LocaleKeys.theHistoryOfWormOutput.tr(context: context),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 17,
                fontWeight: FontWeight.w700
              ),
            ),
          ).toBoxAdapter(),
          20.verticalSpace.toBoxAdapter(),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                // PaymentItem wrapped with padding and divider as separator
                return Column(
                  children: [
                    PaymentItem(paymentHistory: sortedPayments[index]),
                    if (index < sortedPayments.length - 1) // Don't add separator to last item
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Divider(
                          color: Theme.of(context).colorScheme.surface,
                        ),
                      ),
                  ],
                );
              },
              childCount: sortedPayments.length,
            ),
          ),
        ],
      ),
    );
  }
}
