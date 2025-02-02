import 'package:core/core.dart';
import 'package:design_system/design_system.dart' hide AppImage;
import 'widget/road_card.dart';
import 'widget/route_detail_tile.dart';
import '../../responsive.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

part 'page/mobile/mobile.dart';
part 'page/tablet/tablet.dart';

@RoutePage()
class RoadMapPage extends StatelessWidget {
  const RoadMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(mobile: _Mobile(),tablet: _Tablet(),);
  }
}
