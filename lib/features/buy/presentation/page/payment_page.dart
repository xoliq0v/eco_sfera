import 'dart:developer';

import 'package:eco_sfera/core/extension/localization_extension.dart';
import 'package:eco_sfera/features/buy/presentation/page/payment_with_account_number.dart';
import 'package:eco_sfera/features/buy/presentation/page/payment_with_card_page.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> with SingleTickerProviderStateMixin {

  late TabController tabController;
  late PageController pageController;
  
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var l10n = context.l10n;
    var colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(l10n.payment),
        bottom: TabBar(
          controller: tabController,
          indicatorColor: colorScheme.secondary,
          indicatorSize: TabBarIndicatorSize.tab,
          padding: const EdgeInsets.only(left: 15,right: 15),
          dividerColor: colorScheme.surface,
          unselectedLabelColor: Colors.grey,
          onTap: (int? pos){
            FocusScope.of(context).unfocus();
            if(pos!=null){
              pageController.animateToPage(pos,duration: const Duration(milliseconds: 200),curve: Curves.linear);
            }
          },
          tabs: [
            Tab(text: l10n.card,),
            Tab(text: l10n.accountNumber,),
          ],
        ),
      ),
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          PaymentWithCardPage(),
          PaymentWithAccountNumber(),
        ],
      )
    );
  }
}