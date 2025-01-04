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
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.partners.tr(context: context)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    // hintText: LocaleKeys.name.tr(context: context),
                    onChanged: (value) {
                      // _searchOrders(value);
                    },
                  ),
                ),
                IconButton(
                  onPressed: () {
                    FilterSheet.show(context);
                  },
                  icon: SvgPicture.asset(AppIcons.filter),
                ),
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
                controller: scrollController,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 15),
                    child: PartnerItem(
                      title: 'Eko Sfera MChJ',
                      caption: 'caption',
                      distance: 'distance',
                      isNew: false,
                      onTap: () {
                        // _navigateToDetail();
                      },
                    ),
                  );
                },
              )
          ),
        ],
      ),
    );
  }
}

