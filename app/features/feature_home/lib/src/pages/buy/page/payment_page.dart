
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:feature_home/src/pages/auth/auth_screen.dart';
import 'package:feature_home/src/pages/buy/page/payment_with_account_number.dart';
import 'package:feature_home/src/pages/buy/page/payment_with_card_page.dart';
import 'package:feature_home/src/responsive.dart';
import 'package:flutter/material.dart';

part 'mobile/mobile.dart';
part 'mobile/tablet.dart';

@RoutePage()
class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(mobile: _Mobile(), tablet: _Tablet());
  }
}
