import 'package:eco_sfera/core/extension/localization_extension.dart';
import 'package:eco_sfera/core/widgets/dialogs/switch_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../../core/assets/app_icons.dart';
import '../../../core/assets/theme/app_colors.dart';
import '../../../core/constants/route/app_router.gr.dart';
import '../../../core/utils/service/map_service.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_state.dart';
import '../bloc/map_event.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin<HomeScreen> {
  late final MapBloc _mapBloc;
  late final MapService _mapService;
  YandexMapController? _mapController;

  @override
  void initState() {
    super.initState();
    _mapService = GetIt.I<MapService>();
    _mapBloc = GetIt.I<MapBloc>();
  }

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var l10n = context.l10n;

    return BlocProvider.value(
      value: _mapBloc,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          automaticallyImplyLeading: false,
          actions: [
            InkWell(
              onTap: () => SwitchBottomSheet.show(context),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: SvgPicture.asset(
                  AppIcons.userProfile02,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            )
          ],
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(l10n.totalBalance, style: Theme.of(context).textTheme.headlineMedium),
              Text(
                '100 000sum',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppColors.main),
              )
            ],
          ),
        ),
        body: YandexMap(
          nightModeEnabled: Theme.of(context).brightness == Brightness.dark,
          onMapCreated: (controller) {
            _mapController = controller;
            _mapBloc.add(MapCreated(controller));
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}