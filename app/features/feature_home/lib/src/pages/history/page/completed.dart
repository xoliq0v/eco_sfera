part of '../admissions_history_page.dart';

@RoutePage()
class CompletePage extends StatefulWidget {
  const CompletePage({super.key});

  @override
  State<CompletePage> createState() => _CompletedPageState();
}

class _CompletedPageState extends State<CompletePage> {
  final ScrollController _scrollController = ScrollController();
  final ValueNotifier<AuthType?> type = ValueNotifier(null);

  @override
  void initState() {
    super.initState();
    _fetchType();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _fetchType() async {
    type.value = await context.read<TypeBloc>().state.runtimeType == DriverType ? AuthType.driver : AuthType.partner;
    if(type.value == AuthType.driver){
      await context.read<HistoryPaginationCubit>().fetchHistory();
    }
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    if (currentScroll >= maxScroll - 200) {
      if(type.value == AuthType.driver){
        context.read<HistoryPaginationCubit>().fetchHistory();
      }else{
        context.read<PartnerCompletedHistoryCubit>().fetchPartnerCompletedHistory();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AuthType?>(
      valueListenable: type,
      builder: (context, type, child) {
        if(type == null){
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        if(type == AuthType.driver){  
          return BlocBuilder<HistoryPaginationCubit, HistoryPaginationState>(
            builder: (context, state) {
              if (state.isLoadingShimmer) {
              return const Center(child: CircularProgressIndicator.adaptive());
            }
        
            if (state.error != null && state.history.isEmpty) {
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.error.toString()),
                    EcoOutlineButton(onPressed: () async{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(LocaleKeys.update.tr(context: context))));
                      await context.read<HistoryPaginationCubit>().refresh();
                    }, child: Text(LocaleKeys.tryAgain.tr(context: context)))
                  ],
                ),
              );
            }
        
            return LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 600) {
                  return RefreshIndicator(
                    onRefresh: () async {
                      await context.read<HistoryPaginationCubit>().refresh();
                    },
                    child: GridView.builder(
                      controller: _scrollController,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 3,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemCount: state.history.length + (state.isLoadingPagination ? 1 : 0),
                      padding: const EdgeInsets.all(16),
                      itemBuilder: (context, index) {
                        if (index >= state.history.length) {
                          return const Center(
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: CircularProgressIndicator.adaptive(),
                            ),
                          );
                        }
        
                        return HistoryItem(history: state.history[index]);
                      },
                    ),
                  );
                }
        
                if(state.history.isEmpty){
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(LocaleKeys.completedHistoryIsEmpty.tr(context: context)),
                      EcoOutlineButton(
                          onPressed: () async {
                            await context.read<HistoryPaginationCubit>().refresh();
                          }, child: Text(LocaleKeys.update.tr(context: context))),
                    ],
                  );
                }
        
                return RefreshIndicator(
                  onRefresh: () async {
                    await context.read<HistoryPaginationCubit>().refresh();
                  },
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: state.history.length + (state.isLoadingPagination ? 1 : 0),
                    padding: const EdgeInsets.all(16),
                    itemBuilder: (context, index) {
                      if (index >= state.history.length) {
                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: CircularProgressIndicator.adaptive(),
                          ),
                        );
                      }
        
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: HistoryItem(
                          history: state.history[index],
                          onTap: (){
                            // ActiveHistoryBottomSheet.show(context, state.history[index]);
                          },
                        ),
                      );
                    },
                  ),
                );
              },
            );
          },
        );
        }
        if(type == AuthType.partner){
          return BlocBuilder<PartnerCompletedHistoryCubit, PartnerCompletedHistoryState>(
            builder: (context, state) {
              if (state.isLoadingShimmer) {
                return const Center(child: CircularProgressIndicator.adaptive());
              }
              if (state.error != null && state.partnerCompletedOrdersHistory.isEmpty) {
                return Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(state.error.toString()),
                    ],
                  ),
                );
              }
              if(state.partnerCompletedOrdersHistory.isEmpty){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(LocaleKeys.completedHistoryIsEmpty.tr(context: context)),
                  ],
                );
              }
              return SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: RefreshIndicator(
                  onRefresh: () async {
                    await context.read<PartnerCompletedHistoryCubit>().refresh();
                  },
                  child: ListView.builder(
                    itemCount: state.partnerCompletedOrdersHistory.length,
                    controller: _scrollController,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return PartnerCompletedHistoryItem(partnerOrder: state.partnerCompletedOrdersHistory[index]);
                    },
                  ),
                ),
              );
            },
          );
        }
        return const Center(child: CircularProgressIndicator.adaptive());
      }
    );
  }
}

class PartnerCompletedHistoryItem extends StatelessWidget {
  final PartnerOrder partnerOrder;
  const PartnerCompletedHistoryItem({super.key, required this.partnerOrder});

  @override
  Widget build(BuildContext context) {
    return Text(partnerOrder.id.toString());
  }
}