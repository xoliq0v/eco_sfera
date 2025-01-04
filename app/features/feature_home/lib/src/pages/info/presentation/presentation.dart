import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import 'page/comment.dart';
import 'page/payments.dart';

@RoutePage()
class PresentationPage extends StatefulWidget {
  const PresentationPage({super.key});

  @override
  State<PresentationPage> createState() => _PresentationPageState();
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
        title: Text(LocaleKeys.partners.tr(context: context)),
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
          tabs: const [
            Tab(text: 'Payments'),
            Tab(text: 'Comments'),
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
