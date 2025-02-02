import 'package:app_bloc/app_bloc.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import 'page/comment.dart';
import 'page/payments.dart';

@RoutePage()
class PresentationPage extends StatefulWidget implements AutoRouteWrapper {
  const PresentationPage({super.key});

  @override
  State<PresentationPage> createState() => _PresentationPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductCubit>(
          create: (context) => AppBlocHelper.getProductCubit(),
        ),
        BlocProvider<PartnerCommentCubit>(
          create: (context) => AppBlocHelper.getPartnerCommentCubit()
        ),
      ],
      child: this,
    );
  }
}

class _PresentationPageState extends State<PresentationPage> with TickerProviderStateMixin {

  late TabController tabController;
  ValueNotifier<bool> isComments = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.data.tr(context: context)),
        actions: [
          ValueListenableBuilder(
              valueListenable: isComments,
              builder: (p1,p2,p3){
                return isComments.value ? IconButton(
                  icon: Icon(Icons.add),
                  onPressed: (){
                    NavigationUtils.getMainNavigator().navigateAddCommentPage();
                  },
                ) : const SizedBox.shrink();
              }
          )
        ],
        bottom: TabBar(
          onTap: (index){
            print(index);
            isComments.value = index == 1;
          },
          controller: tabController,
          tabs: [
            Tab(text: LocaleKeys.payment.tr(context: context)),
            Tab(text: LocaleKeys.comments.tr(context: context)),
          ],
          unselectedLabelColor: Theme.of(context).textTheme.headlineMedium?.color,
          indicator: BoxDecoration(
            color: Colors.transparent,
            border: Border(
              bottom: BorderSide(
                color: context.colorScheme.secondary,
                width: 2,
              ),
            ),
          ),
          dividerColor: Colors.transparent,
        ),
      ),
      body: TabBarView(
        controller: tabController,
        physics: NeverScrollableScrollPhysics(),
        children: const [
          PaymentPage(),
          CommentPage(),
        ],
      ),
    );
  }
}
