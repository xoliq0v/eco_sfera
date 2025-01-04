
part of '../payment_page.dart';

class _Tablet extends StatefulWidget {
  const _Tablet({super.key});

  @override
  State<_Tablet> createState() => Tablet();
}

class Tablet extends State<_Tablet> with SingleTickerProviderStateMixin {

  late TabController tabController;
  late PageController pageController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: false,
          title: Text(LocaleKeys.payment.tr(context: context)),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48.0), // Adjust height as needed
            child: Row(
              children: [
                // Pushes the TabBar to the right
                15.horizontalSpace,
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 600), // Adjust the width as needed
                  child: TabBar(
                    controller: tabController,
                    indicatorColor: colorScheme.secondary,
                    indicatorSize: TabBarIndicatorSize.tab,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    dividerColor: colorScheme.surface,
                    unselectedLabelColor: Colors.grey,
                    onTap: (int? pos) {
                      FocusScope.of(context).unfocus();
                      if (pos != null) {
                        pageController.animateToPage(
                          pos,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.linear,
                        );
                      }
                    },
                    tabs: [
                      Tab(text: LocaleKeys.card.tr(context: context)),
                      Tab(text: LocaleKeys.accountNumber.tr(context: context)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            // PaymentWithCardPage(),
            // PaymentWithAccountNumber(),
          ],
        )
    );
  }
}
