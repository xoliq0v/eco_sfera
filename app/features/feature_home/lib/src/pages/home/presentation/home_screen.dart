import 'package:core/core.dart' hide CameraUpdate;
import 'package:design_system/design_system.dart';
import '../../../responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:map_service/map_service.dart';
import 'package:yandex_mapkit_lite/yandex_mapkit_lite.dart';

part 'page/mobile.dart';
part 'page/tablet.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(mobile: _Mobile(), tablet: _Tablet());
  }
}
