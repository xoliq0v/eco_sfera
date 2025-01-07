
part of '../payment_page.dart';

class _Mobile extends StatefulWidget {
  final BuyReq params;
  const _Mobile({super.key,required this.params});

  @override
  State<_Mobile> createState() => Mobile();
}

class Mobile extends State<_Mobile> with SingleTickerProviderStateMixin {

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
          title: Text(LocaleKeys.payment.tr(context: context)),
          // bottom: TabBar(
          //   controller: tabController,
          //   indicatorColor: colorScheme.secondary,
          //   indicatorSize: TabBarIndicatorSize.tab,
          //   padding: const EdgeInsets.only(left: 15,right: 15),
          //   dividerColor: colorScheme.surface,
          //   unselectedLabelColor: Colors.grey,
          //   onTap: (int? pos){
          //     FocusScope.of(context).unfocus();
          //     if(pos!=null){
          //       pageController.animateToPage(pos,duration: const Duration(milliseconds: 200),curve: Curves.linear);
          //     }
          //   },
          //   tabs: [
          //     Tab(text: LocaleKeys.cash.tr(context: context),),
          //     Tab(text: LocaleKeys.accountNumber.tr(context: context),),
          //   ],
          // ),
        ),
        body: AutoTabsRouter(
          routes: [
            PaymentWithCardRoute(params: widget.params),
            // PaymentWithAccountNumberRoute(),
          ],
          builder: (context, child) {
            return child;
          },
        )
    );
  }
}
