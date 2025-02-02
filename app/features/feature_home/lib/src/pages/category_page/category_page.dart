import 'presentation/widget/eco_service_item.dart';
import 'presentation/widget/tab_eco_service_item.dart';
import '../../responsive.dart';
import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart' hide AppImage;
import 'package:navigation/navigation.dart';

part 'presentation/page/mobile.dart';
part 'presentation/page/tablet.dart';

@RoutePage()
class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(mobile: _Mobile(), tablet: _Tablet());
  }
}
