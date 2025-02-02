
part of '../home_screen.dart';

class _Mobile extends StatefulWidget {
  const _Mobile();

  @override
  State<_Mobile> createState() => Mobile();
}

class Mobile extends State<_Mobile> {

  late YandexMapController mapController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    mapController.dispose();
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
              '0sum',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppColors.main),
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          YandexMap(
            onMapCreated: (controller){
              mapController = controller;
            },
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 15,
                bottom: 25
              ),
              child: Column(
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: context.colorScheme.surface,
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: InkWell(
                      onTap: () async{
                        mapController.zoomIn();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Image.asset(AppIcons.plus),
                      ),
                    ),
                  ),

                  10.verticalSpace,

                  DecoratedBox(
                    decoration: BoxDecoration(
                        color: context.colorScheme.surface,
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child: InkWell(
                      onTap: () async{
                        mapController.zoomOut();
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 26.0,horizontal: 18),
                        child: Image.asset(AppIcons.minus),
                      ),
                    ),
                  ),

                  10.verticalSpace,

                  DecoratedBox(
                    decoration: BoxDecoration(
                        color: context.colorScheme.surface,
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child: InkWell(
                      onTap: () async{

                      },
                      child: Padding(
                        padding: const EdgeInsets.all(17.0),
                        child: Image.asset(AppIcons.position),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}