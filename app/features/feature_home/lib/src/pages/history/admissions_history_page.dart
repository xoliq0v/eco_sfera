

import 'dart:developer';
import 'dart:typed_data';

import 'package:app_bloc/app_bloc.dart';
import 'package:core/core.dart' hide Order;
import 'package:design_system/design_system.dart';
import 'widget/history_item.dart';
import 'package:flutter/material.dart';
import 'package:model/model.dart';

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
        BlocProvider<PartnerHistoryCubit>(
          create: (_) => AppBlocHelper.getPartnerHistoryCubit(),
        ),
        BlocProvider<PartnerCompletedHistoryCubit>(
          create: (_) => AppBlocHelper.getPartnerCompletedHistoryCubit(),
        ),
        BlocProvider<TypeBloc>(
          create: (_) => AppBlocHelper.getTypeBloc(),
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
    return BlocBuilder<TypeBloc,AuthTypeState>(
      builder: (context,state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(LocaleKeys.history.tr(context: context)),
            bottom: state.runtimeType == DriverType ? TabBar(
              controller: tabController,
              tabs: [
                Tab(text: LocaleKeys.active.tr(context: context)),
                Tab(text: LocaleKeys.completed.tr(context: context)),
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
            ) : null,
          ),
          body: BlocBuilder<TypeBloc,AuthTypeState>(
            builder: (context,state) {
              return TabBarView(
                controller: tabController,
                children: state.runtimeType == DriverType ? [
                  ActivePage(),
                  CompletePage(),
                ] : [ActivePage(),],
              );
            }
          ),
        );
      }
    );
  }
}
