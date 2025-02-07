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
    // Listen to TypeBloc state changes
    final typeState = context.read<TypeBloc>().state;
    if (typeState is DriverType) {
      type.value = AuthType.driver;
      await context.read<ActiveHistoryCubit>().fetchHistory();
    } else {
      type.value = AuthType.partner;
      await context.read<PartnerHistoryCubit>().fetchPartnerHistory();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TypeBloc, AuthTypeState>(
      listener: (context, state) {
        if (state is DriverType) {
          type.value = AuthType.driver;
          context.read<ActiveHistoryCubit>().refresh();
        } else {
          type.value = AuthType.partner;
          context.read<PartnerHistoryCubit>().refresh();
        }
      },
      child: ValueListenableBuilder<AuthType>(
        valueListenable: type,
        builder: (context, currentType, child) {
          if (currentType == AuthType.def) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }

          // Return appropriate widget based on type
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
        if (state.isLoadingShimmer) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }

        if (state.history.isEmpty) {
          return _buildEmptyState(() {
            context.read<ActiveHistoryCubit>().refresh();
          });
        }

        if (state.error != null) {
          return _buildErrorState(state.error.toString(), () {
            context.read<ActiveHistoryCubit>().refresh();
          });
        }

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

            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: ActiveItem(
                history: state.history[index],
                onTap: () {
                  ActiveHistoryBottomSheet.show(context, state.history[index]);
                },
              ),
            );
          },
          onRefresh: () async {
            await context.read<ActiveHistoryCubit>().refresh();
          },
        );
      },
    );
  }

  Widget _buildPartnerContent() {
    return BlocBuilder<PartnerHistoryCubit, PartnerHistoryState>(
      builder: (context, state) {
        if (state.isLoadingShimmer) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }

        if (state.partnerOrdersHistory.isEmpty) {
          return _buildEmptyState(() {
            context.read<PartnerHistoryCubit>().refresh();
          });
        }

        if (state.error != null) {
          return _buildErrorState(state.error.toString(), () {
            context.read<PartnerHistoryCubit>().refresh();
          });
        }

        return _buildHistoryList(
          itemCount: state.partnerOrdersHistory.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: _Item(
                history: state.partnerOrdersHistory[index],
                onTap: () {
                  PartnerHistoryBottomSheet.show(
                    context,
                    state.partnerOrdersHistory[index],
                  );
                },
              ),
            );
          },
          onRefresh: () async {
            await context.read<PartnerHistoryCubit>().refresh();
          },
        );
      },
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

          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: ListView.builder(
              controller: _scrollController,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: itemCount,
              padding: const EdgeInsets.all(16),
              itemBuilder: itemBuilder,
            ),
          );
        },
      ),
    );
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    if (currentScroll >= maxScroll - 200) {
      if (type.value == AuthType.driver) {
        context.read<ActiveHistoryCubit>().fetchHistory();
      } else {
        context.read<PartnerHistoryCubit>().fetchPartnerHistory();
      }
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