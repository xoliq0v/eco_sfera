import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import '../../../responsive.dart';
import 'package:flutter/material.dart';

import 'page/widget/history_item.dart';

part 'page/mobile/page.dart';
part 'page/mobile/component/search_field.dart';
part 'page/mobile/component/loading.dart';
part 'page/mobile/component/search_body.dart';
part 'page/mobile/component/bottom_loading.dart';

@RoutePage()
class PartnersPage extends StatelessWidget {
  const PartnersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(mobile: _Mobile(), tablet: SizedBox.shrink());
  }
}
