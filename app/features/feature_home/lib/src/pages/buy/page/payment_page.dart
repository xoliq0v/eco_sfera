
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:feature_home/src/pages/auth/auth_screen.dart';
import 'package:feature_home/src/pages/buy/page/payment_with_account_number.dart';
import 'package:feature_home/src/pages/buy/page/payment_with_card_page.dart';
import 'package:feature_home/src/responsive.dart';
import 'package:flutter/material.dart';
import 'package:model/model.dart';

part 'mobile/mobile.dart';
part 'mobile/tablet.dart';

@RoutePage()
class PaymentPage extends StatelessWidget {
  final BuyModel params;
  const PaymentPage({super.key,required this.params});

  @override
  Widget build(BuildContext context) {
    return  Responsive(mobile: _Mobile(params: params,), tablet: _Tablet());
  }
}
