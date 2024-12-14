import 'package:core/core.dart';
import 'package:core/generated/locale_keys.g.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:map_service/map_service.dart';

class FilterSheet {
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.grey.withOpacity(0.85),
      builder: (context) => const _FilterSheetContent(),
    );
  }
}

class _FilterSheetContent extends StatelessWidget {
  const _FilterSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        children: [
          _SheetBody(),
        ],
      ),
    );
  }
}

class _SheetBody extends StatelessWidget {

  ValueNotifier<int?> _selectedCustomerIndex = ValueNotifier(0);

  final List<String> list = [
    LocaleKeys.showAll,
    LocaleKeys.showNearbyPeople,
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.9,
      width: double.maxFinite,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            5.verticalSpace,
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.6,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                      LocaleKeys.filter.tr(context: context),
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 23,
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: (){
                      context.popBottomSheet();
                    },
                    child: Text(
                      LocaleKeys.cancel.tr(context: context),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.main
                      ),
                    )
                  ),
                  10.horizontalSpace
                ],
              ),
            ),
            ValueListenableBuilder(
              valueListenable: _selectedCustomerIndex,
              builder: (context,p1,p2) {
                return Expanded(
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                      itemCount: list.length,
                      itemBuilder: (context,index){
                        return ListTile(
                          title: Text(list[index].tr(context: context)),
                          trailing: Radio<int>(
                            value: index,
                            groupValue: _selectedCustomerIndex.value,
                            onChanged: (int? value) {
                                _selectedCustomerIndex.value = value;
                            },
                          ),
                        );
                      }
                  ),
                );
              }
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 30
              ),
              child: EcoElevatedButton.loading(
                  onPressed: (){},
                  child: Text(LocaleKeys.showOrders.tr(args: ['13'])),
                  loading: false
              ),
            ),
          ],
        ),
      ),
    );
  }

}

class _MapWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 150,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: MapWidget(),
        ),
      ),
    );
  }
}

class _ItemRow extends StatelessWidget {
  final String title;
  final String value;

  const _ItemRow({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,),
          Text(value),
        ],
      ),
    );
  }
}