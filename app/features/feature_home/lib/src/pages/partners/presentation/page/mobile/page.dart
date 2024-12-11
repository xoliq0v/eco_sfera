part of '../../partners_page.dart';

class _Mobile extends StatefulWidget {
  const _Mobile({super.key});

  @override
  State<_Mobile> createState() => _MobileState();
}

class _MobileState extends State<_Mobile> {

  final TextEditingController searchController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    searchController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
        slivers: [
          MySliverAppBar(
            toolbarHeight: 64.h,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.symmetric(
                vertical: 8.h,
                horizontal: 16.w,
              ),
              title: MainTextField.withClear(
                label: LocaleKeys.partners.tr(context: context),
                height: 48.h,
                controller: searchController,
                onTapOutsideUnFocus: true,
              ),
            ),
          ),
          10.verticalSpace.toBoxAdapter(),
          _SearchField(controller: searchController).toBoxAdapter(),
          const _Loading(),
          // _Body(),
          const _BottomLoading(),
        ],
    );
  }
}
