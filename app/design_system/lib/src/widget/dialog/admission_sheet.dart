import '../../../design_system.dart';
import 'package:flutter/material.dart';
import 'package:map_service/map_service.dart';

class AdmissionSheet {
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.grey.withOpacity(0.85),
      builder: (context) => const _AdmissionSheetContent(),
    );
  }
}

class _AdmissionSheetContent extends StatelessWidget {
  const _AdmissionSheetContent();

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
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.maxFinite,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(18.0),
              child: Text('13.08.2024  11:01'),
            ),
            ..._buildItemRows(),
            30.verticalSpace,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Jami:'),
                  Text('50 000sum'),
                ],
              ),
            ),
            AppScreen.bottomBarHeight.verticalSpace
          ],
        ),
      ),
    );
  }

  List<Widget> _buildItemRows() {
    final items = [
      ('Lorem ipsum', '2kg 6 000sum'),
      ('Lorem ipsum', '2kg 6 000sum'),
      ('Lorem ipsum', '2kg 6 000sum'),
    ];

    return items.map((item) => _ItemRow(title: item.$1, value: item.$2)).toList();
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