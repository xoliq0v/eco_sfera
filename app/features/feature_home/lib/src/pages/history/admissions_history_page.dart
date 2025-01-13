

import 'package:app_bloc/app_bloc.dart';
import 'package:core/core.dart' hide Order;
import 'package:design_system/design_system.dart';
import 'widget/history_item.dart';
import 'package:flutter/material.dart';
import 'package:model/model.dart';

import '../../../feature_home.dart';
import '../auth/auth_screen.dart';
import 'widget/active_item.dart';

part 'page/active.dart';
part 'page/completed.dart';

@RoutePage()
class AdmissionsHistoryPage extends StatefulWidget implements AutoRouteWrapper{
  const AdmissionsHistoryPage({super.key});

  @override
  State<AdmissionsHistoryPage> createState() => _AdmissionsHistoryPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HistoryPaginationCubit>(
          create: (_) => AppBlocHelper.getHistoryCubit(),
        ),
        BlocProvider<ActiveHistoryCubit>(
          create: (_) => AppBlocHelper.getActiveHistory(),
        ),
      ],
      child: this,
    );
  }
}

class _AdmissionsHistoryPageState extends State<AdmissionsHistoryPage> with TickerProviderStateMixin{

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.history.tr(context: context)),
        bottom: TabBar(
          controller: tabController,
          tabs: const [
            Tab(text: 'Active'),
            Tab(text: 'Completed'),
          ],
          unselectedLabelColor: Theme.of(context).textTheme.headlineMedium?.color,
          indicator: BoxDecoration(
            color: Colors.transparent,
            border: Border(
              bottom: BorderSide(
                color: context.colorScheme.secondary,
                width: 2,
              ),
            ),
          ),
          dividerColor: Colors.transparent,
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          ActivePage(),
          CompletePage(),
        ],
      ),
    );
  }
}
