part of '../admissions_history_page.dart';

@RoutePage()
class CompletePage extends StatefulWidget {
  const CompletePage({super.key});

  @override
  State<CompletePage> createState() => _CompletedPageState();
}

class _CompletedPageState extends State<CompletePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
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
      context.read<HistoryPaginationCubit>().fetchHistory();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryPaginationCubit, HistoryPaginationState>(
      builder: (context, state) {
        if (state.isLoadingShimmer) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }

        if (state.error != null && state.history.isEmpty) {
          return Center(child: Text(state.error.toString()));
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
                  Text('Empty'),
                  ElevatedButton(
                      onPressed: () async {
                        await context.read<HistoryPaginationCubit>().refresh();
                      }, child: Text(LocaleKeys.tryAgain.tr(context: context))),
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
}