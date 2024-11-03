import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:map_service/map_service.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
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
              // SwitchBottomSheet.show(context)
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
      body: YandexMap(
        nightModeEnabled: Theme.of(context).brightness == Brightness.dark,
        onMapCreated: (controller) {

        },
      ),
    );
  }
}