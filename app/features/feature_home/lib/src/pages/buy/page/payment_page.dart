
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import '../../auth/auth_screen.dart';
import 'payment_with_account_number.dart';
import 'payment_with_card_page.dart';
import '../../../responsive.dart';
import 'package:flutter/material.dart';
import 'package:model/model.dart';

import '../../../../feature_home.dart';

part 'mobile/mobile.dart';
part 'mobile/tablet.dart';

@RoutePage()
class PaymentPage extends StatelessWidget {
  final BuyReq params;
  const PaymentPage({super.key,required this.params});

  @override
  Widget build(BuildContext context) {
    return  Responsive(mobile: _Mobile(params: params,), tablet: _Tablet());
  }
}
