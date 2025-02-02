part of '../../partners_page.dart';

class _Mobile extends StatefulWidget {
  const _Mobile({super.key});

  @override
  State<_Mobile> createState() => _MobileState();
}

class _MobileState extends State<_Mobile> {

  final ScrollController _scrollController = ScrollController();
  final TextEditingController searchController = TextEditingController();
  final ScrollController scrollController = ScrollController();


  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    searchController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    if (currentScroll >= maxScroll - 200) {
      context.read<PartnerPaginationCubit>().fetchHistory();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.partners.tr(context: context)),
      ),
      body: BlocBuilder<PartnerPaginationCubit,PartnerPaginationState>(
        builder: (context,state) {
          if (state.isLoadingShimmer) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }

          if (state.error != null && state.history.isEmpty) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.error.toString()),
                ElevatedButton(onPressed: (){
                  context.read<PartnerPaginationCubit>().refresh();
                }, child: Text(LocaleKeys.tryAgain.tr(context: context)))
              ],
            );
          }

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: LocaleKeys.search.tr(context: context),
                        ),
                        // hintText: LocaleKeys.name.tr(context: context),
                        onChanged: (value) {
                          // _searchOrders(value);
                        },
                      ),
                    ),
                    // IconButton(
                    //   onPressed: () {
                    //     FilterSheet.show(context);
                    //   },
                    //   icon: SvgPicture.asset(AppIcons.filter),
                    // ),
                  ],
                ),
              ),
              Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      await context.read<PartnerPaginationCubit>().refresh();
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
                          child: PartnerWidget(
                            onTap: (){
                              NavigationUtils.getMainNavigator().navigateSubmissionPage(state.history[index].id,state.history[index]);
                            },
                            partner: state.history[index],
                          ),
                        );
                      },
                    ),
                  ),
              ),
            ],
          );
        }
      ),
    );
  }
}

