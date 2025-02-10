part of '../admissions_history_page.dart';

@RoutePage()
class ActivePage extends StatefulWidget {
  const ActivePage({super.key});

  @override
  State<ActivePage> createState() => _ActivePageState();
}

class _ActivePageState extends State<ActivePage> {
  final ScrollController _scrollController = ScrollController();
  final ValueNotifier<AuthType> type = ValueNotifier(AuthType.def);

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) => _fetchType());
  }

  Future<void> _fetchType() async {
    final typeState = context.read<TypeBloc>().state;
    type.value = typeState is DriverType ? AuthType.driver : AuthType.partner;
    await _fetchHistory(); // Yangi method
  }

  Future<void> _fetchHistory() async {
    if (type.value == AuthType.driver) {
      await context.read<ActiveHistoryCubit>().fetchHistory();
    } else {
      await context.read<PartnerHistoryCubit>().fetchPartnerHistory();
    }
  }

  void _refreshHistory() {
    if (type.value == AuthType.driver) {
      context.read<ActiveHistoryCubit>().refresh();
    } else {
      context.read<PartnerHistoryCubit>().refresh();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TypeBloc, AuthTypeState>(
      listener: (context, state) {
        type.value = state is DriverType ? AuthType.driver : AuthType.partner;
        _refreshHistory();
      },
      child: ValueListenableBuilder<AuthType>(
        valueListenable: type,
        builder: (context, currentType, child) {
          if (currentType == AuthType.def) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          return currentType == AuthType.driver
              ? _buildDriverContent()
              : _buildPartnerContent();
        },
      ),
    );
  }

Widget _buildDriverContent() {
  return BlocBuilder<ActiveHistoryCubit, ActiveHistoryPaginationState>(
    builder: (context, state) {
      log('FUCK HISTORY STATE: ${state.error}');
      // Agar loading bo'lsa
      if (state.isLoadingShimmer) {
        return const Center(child: CircularProgressIndicator.adaptive());
      }

      // Agar ma'lumotlar bo'lsa va error bo'lmasa
      if (state.history.isNotEmpty) {
        return _buildHistoryList(
          itemCount: state.history.length + (state.isLoadingPagination ? 1 : 0),
          itemBuilder: (context, index) {
            if (index >= state.history.length) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: CircularProgressIndicator.adaptive(),
                ),
              );
            }

            final item = state.history[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: ActiveItem(
                history: item,
                onTap: () => ActiveHistoryBottomSheet.show(context, item),
              ),
            );
          },
          onRefresh: () => context.read<ActiveHistoryCubit>().refresh(),
        );
      }

      // Agar ma'lumotlar bo'sh bo'lsa
      if (state.history.isEmpty && state.error == null) {
        return _buildEmptyState(
          () => context.read<ActiveHistoryCubit>().refresh(),
        );
      }

      // Agar error bo'lsa
      if (state.error != null) {
        return _buildErrorState(
          state.error.toString(),
          () => context.read<ActiveHistoryCubit>().refresh(),
        );
      }

      // Default holat
      return const Center(child: CircularProgressIndicator.adaptive());
    },
  );
}

  Widget _buildPartnerContent() {
    return BlocBuilder<PartnerHistoryCubit, PartnerHistoryState>(
      builder: (context, state) {
        if (state.isLoadingShimmer) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }

        if (state.error != null) {
          return _buildErrorState(
            state.error.toString(),
            () => context.read<PartnerHistoryCubit>().refresh(),
          );
        }

        if (state.partnerOrdersHistory.isEmpty) {
          return _buildEmptyState(
            () => context.read<PartnerHistoryCubit>().refresh(),
          );
        }

        return _buildHistoryList(
          itemCount: state.partnerOrdersHistory.length,
          itemBuilder: (context, index) {
            final item = state.partnerOrdersHistory[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: _Item(
                history: item,
                onTap: () => PartnerHistoryBottomSheet.show(context, item),
              ),
            );
          },
          onRefresh: () => context.read<PartnerHistoryCubit>().refresh(),
        );
      },
    );
  }

  Widget _buildHistoryList({
    required int itemCount,
    required Widget Function(BuildContext, int) itemBuilder,
    required Future<void> Function() onRefresh,
  }) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return GridView.builder(
              controller: _scrollController,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: itemCount,
              padding: const EdgeInsets.all(16),
              itemBuilder: itemBuilder,
            );
          }

          return ListView.builder(
            controller: _scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: itemCount,
            padding: const EdgeInsets.all(16),
            itemBuilder: itemBuilder,
          );
        },
      ),
    );
  }

  Widget _buildEmptyState(VoidCallback onRefresh) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(LocaleKeys.activeHistoryIsEmpty.tr(context: context)),
        5.verticalSpace,
        EcoOutlineButton(
          onPressed: onRefresh,
          child: Text(LocaleKeys.update.tr(context: context)),
        ),
      ],
    );
  }

  Widget _buildErrorState(String error, VoidCallback onRetry) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(error),
        5.verticalSpace,
        EcoOutlineButton(
          onPressed: onRetry,
          child: Text(LocaleKeys.tryAgain.tr(context: context)),
        ),
      ],
    );
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    if (currentScroll >= maxScroll - 200) {
      _fetchHistory();
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }
}

class _Item extends StatelessWidget {
  final PartnerOrder history; 
  final VoidCallback onTap;
  const _Item({required this.history, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: double.maxFinite,
        height: 150,
        child: DecoratedBox(
          decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    color: Colors.grey,
                    blurRadius: 1
                )
              ],
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(25)
          ),
          child: Column(
            children: [
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 5,
                                  left: 5,
                                  top: 15
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    history.driver.name ?? '',
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 20,
                                        color: context.colorScheme.primary
                                    ),
                                  ),
                                  Flexible(
                                      child: Text(
                                        history.driver.phoneNumber?.formatUzbekPhoneNumber() ?? '',
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context).textTheme.headlineMedium,
                                      )
                                  )
                                ],
                              ),
                            )
                        ),
                      ],
                    ),
                  )
              ),
              const Divider(color: Colors.grey,),
              Padding(
                padding: const EdgeInsets.only(
                    right: 20,
                    left: 20,
                    top: 10,
                    bottom: 10
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('${history.date}',style: Theme.of(context).textTheme.headlineMedium,),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}