
part of '../home_screen.dart';

class _Mobile extends StatefulWidget {
  const _Mobile({super.key});

  @override
  State<_Mobile> createState() => Mobile();
}

class Mobile extends State<_Mobile> {

  late YandexMapController yandexMapController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    yandexMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
            onTap: () => {
              SwitchBottomSheet.show(context)
            },
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: SvgPicture.asset(
                AppIcons.userProfile02,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          )
        ],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(LocaleKeys.totalBalance.tr(context: context), style: Theme.of(context).textTheme.headlineMedium),
            Text(
              '100 000sum',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppColors.main),
            )
          ],
        ),
      ),
      body: MapWidget(
        onControllerCreated: (controller) {
          yandexMapController = controller;
        }, mapObjects: [],
      ),
    );
  }
}