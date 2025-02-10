part of '../../partners_page.dart';

class _Mobile extends StatefulWidget {
  const _Mobile({super.key});

  @override
  State<_Mobile> createState() => _MobileState();
}

class _MobileState extends State<_Mobile> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController searchController = TextEditingController();
  Timer? _searchDebounce;
  final _debouncer = Debouncer(milliseconds: 300);

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _debouncer.dispose();
    _searchDebounce?.cancel();
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    searchController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    if (currentScroll >= maxScroll - 200) {
      context.read<PartnerPaginationCubit>().fetchHistory();
    }
  }

  void _onSearchChanged(String query) {
    if (_searchDebounce?.isActive ?? false) _searchDebounce?.cancel();
    _debouncer.run(() {
      context.read<PartnerPaginationCubit>().updateSearchQuery(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.partners.tr(context: context)),
      ),
      body: BlocBuilder<PartnerPaginationCubit, PartnerPaginationState>(
        builder: (context, state) {
          if (state.isLoadingShimmer) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }

          if (state.error != null && state.history.isEmpty) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.error.toString()),
                ElevatedButton(
                  onPressed: () {
                    context.read<PartnerPaginationCubit>().refresh();
                  },
                  child: Text(LocaleKeys.tryAgain.tr(context: context)),
                )
              ],
            );
          }

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: LocaleKeys.search.tr(context: context),
                        ),
                        onChanged: _onSearchChanged,
                      ),
                    ),
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
                    itemCount: state.filteredHistory.length + (state.isLoadingPagination ? 1 : 0),
                    padding: const EdgeInsets.all(16),
                    itemBuilder: (context, index) {
                      if (index >= state.filteredHistory.length) {
                        return Center(
                          child: CircularProgressIndicator.adaptive(),
                        );
                      }
                      if (index >= state.history.length) {
                        return const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Center(child: CircularProgressIndicator.adaptive()),
                        );
                      }

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: PartnerWidget(
                          onTap: () {
                            NavigationUtils.getMainNavigator()
                                .navigateSubmissionPage(state.history[index].id, state.history[index]);
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
        },
      ),
    );
  }
}