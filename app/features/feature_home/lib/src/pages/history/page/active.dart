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
    type.value = await context.read<TypeBloc>().state.runtimeType == DriverType ? AuthType.driver : AuthType.partner;
    if(type.value == AuthType.driver){
      await context.read<ActiveHistoryCubit>().fetchHistory();
    }
  }

  Widget _buildErrorOrEmpty(String message, VoidCallback onRetry) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(message),
      const SizedBox(height: 5),
      EcoOutlineButton(
        onPressed: onRetry,
        child: Text(LocaleKeys.tryAgain.tr(context: context))
      )
    ],
  );
}

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    if (currentScroll >= maxScroll - 200) {
      if(type.value == AuthType.driver){
        context.read<ActiveHistoryCubit>().fetchHistory();
      }else{
        context.read<PartnerHistoryCubit>().fetchPartnerHistory();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
      stream: null,
      builder: (context, snapshot) {
        return ValueListenableBuilder<AuthType>(
          valueListenable: type,
          builder: (context, type, child) {
            if(type == AuthType.def){
              return const Center(child: CircularProgressIndicator.adaptive());
            }
            if(type == AuthType.driver){
              return BlocBuilder<ActiveHistoryCubit, ActiveHistoryPaginationState>(
                builder: (context, state) {
                  if (state.isLoadingShimmer) {
                  return const Center(child: CircularProgressIndicator.adaptive());
                }
            
                if(state.history.isEmpty){
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(LocaleKeys.activeHistoryIsEmpty.tr(context: context)),
                      5.verticalSpace,
                      EcoOutlineButton(onPressed: (){
                        context.read<ActiveHistoryCubit>().refresh();
                      }, child: Text(LocaleKeys.update.tr(context: context)))
                    ],
                  );
            
                }
            
                if (state.error != null) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(state.error.toString()),
                      5.verticalSpace,
                      EcoOutlineButton(onPressed: (){
                        context.read<ActiveHistoryCubit>().refresh();
                      }, child: Text(LocaleKeys.tryAgain.tr(context: context)))
                    ],
                  );
                }
            
                return LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth > 600) {
                      return RefreshIndicator(
                        onRefresh: () async {
                          await context.read<ActiveHistoryCubit>().refresh();
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
            
                            return ActiveItem(history: state.history[index]);
                          },
                        ),
                      );
                    }
            
                    return RefreshIndicator(
                      onRefresh: () async {
                        await context.read<ActiveHistoryCubit>().refresh();
                      },
                      child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        // constraints: BoxConstraints(
                        //   minHeight: MediaQuery.of(context).size.height,
                        // ),
                        child: ListView.builder(
                          controller: _scrollController,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
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
                              child: ActiveItem(
                                  history: state.history[index],
                                onTap: (){
                                    ActiveHistoryBottomSheet.show(context, state.history[index]);
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                );
              },
            );
            }
            if(type == AuthType.partner){
              return BlocBuilder<PartnerHistoryCubit, PartnerHistoryState>(
                builder: (context, state) {
                  if(state.isLoadingShimmer){
                    return const Center(child: CircularProgressIndicator.adaptive());
                  }
                if(state.partnerOrdersHistory.isEmpty){
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(LocaleKeys.activeHistoryIsEmpty.tr(context: context)),
                      5.verticalSpace,
                      EcoOutlineButton(onPressed: (){
                        context.read<PartnerHistoryCubit>().refresh();
                      }, child: Text(LocaleKeys.update.tr(context: context)))
                    ],
                  );
                }
                if(state.error != null){
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(state.error.toString()),
                      5.verticalSpace,
                      EcoOutlineButton(onPressed: (){
                        context.read<PartnerHistoryCubit>().refresh();
                      }, child: Text(LocaleKeys.tryAgain.tr(context: context)))
                    ],
                  );
                }
                return SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: RefreshIndicator(
                    onRefresh: () async {
                      await context.read<PartnerHistoryCubit>().refresh();
                    },
                    child: ListView.builder(
                      itemCount: state.partnerOrdersHistory.length,
                      controller: _scrollController,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index){
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 16),
                          child: _Item(history: state.partnerOrdersHistory[index], onTap: (){
                            PartnerHistoryBottomSheet.show(context, state.partnerOrdersHistory[index]);
                          }),
                        );
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
    );
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