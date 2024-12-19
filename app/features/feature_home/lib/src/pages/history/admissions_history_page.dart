

import 'package:app_bloc/app_bloc.dart';
import 'package:core/core.dart' hide Order;
import 'package:feature_home/src/pages/history/widget/history_item.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AdmissionsHistoryPage extends StatefulWidget implements AutoRouteWrapper{
  const AdmissionsHistoryPage({super.key});

  @override
  State<AdmissionsHistoryPage> createState() => _AdmissionsHistoryPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<HistoryPaginationCubit>(
      create: (_) => AppBlocHelper.getHistoryCubit(),
      child: this,
    );
  }
}

class _AdmissionsHistoryPageState extends State<AdmissionsHistoryPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(LocaleKeys.admissionsHistory.tr(context: context),),
      ),
      body: BlocBuilder<HistoryPaginationCubit,HistoryPaginationState>(
        builder: (context,state) {
          if(state.isLoadingShimmer) return Center(child: CircularProgressIndicator.adaptive(),);
          if(state.error != null) return Center(child: Text(state.error.toString()),);
          return LayoutBuilder(
            builder: (context, constraints) {
              // Use GridView for wider screens (e.g. tablets, landscape)
              if (constraints.maxWidth > 600) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Fixed 2 columns
                    childAspectRatio: 3,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: 3,
                  padding: const EdgeInsets.all(16),
                  itemBuilder: (context, index) {
                    return SizedBox();
                  },
                );
              }
              // Use ListView for narrower screens (e.g. phones, portrait)
              return ListView.builder(
                itemCount: state.history.length,
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: HistoryItem(history: state.history[index]),
                  );
                },
              );
            },
          );
        }
      ),
    );
  }
}
