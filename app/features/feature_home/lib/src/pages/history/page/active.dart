part of '../admissions_history_page.dart';

@RoutePage()
class ActivePage extends StatefulWidget {
  const ActivePage({super.key});

  @override
  State<ActivePage> createState() => _ActivePageState();
}

class _ActivePageState extends State<ActivePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryPaginationCubit,HistoryPaginationState>(
        builder: (context,state) {
          if(state.isLoadingShimmer) return Center(child: CircularProgressIndicator.adaptive(),);
          if(state.error != null) return Center(child: Text(state.error.toString()),);
          return LayoutBuilder(
            builder: (context, constraints) {
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
    );
  }
}
