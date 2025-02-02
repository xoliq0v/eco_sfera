
part of '../home_screen.dart';

class _Tablet extends StatefulWidget {
  const _Tablet();

  @override
  State<_Tablet> createState() => Tablet();
}

class Tablet extends State<_Tablet> {

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
    return Material(
      child: Stack(
        children: [
          const YandexMap(),
          Positioned(
              left: 20,
              top: AppScreen.statusBarHeight + 10,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(-2, 0),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 50),
                  child: Column(
                    children: [
                      Text(LocaleKeys.totalBalance.tr(context: context), style: Theme.of(context).textTheme.headlineMedium),
                      Text(
                        '100 000sum',
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: AppColors.main,fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              )
          )
        ],
      ),
    );
  }
}