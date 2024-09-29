import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

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
  const _AdmissionSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        children: [
          Container(
            width: 60,
            height: 4,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(250),
            ),
          ),
          const Gap(10),
          _SheetBody(),
        ],
      ),
    );
  }
}

class _SheetBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(5),
          _MapWidget(),
          const Padding(
            padding: EdgeInsets.all(18.0),
            child: Text('13.08.2024  11:01'),
          ),
          ..._buildItemRows(),
          const Gap(30),
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
        ],
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
      width: double.infinity,
      height: 150,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: YandexMap(
            scrollGesturesEnabled: false,
            rotateGesturesEnabled: false,
            tiltGesturesEnabled: false,
            zoomGesturesEnabled: false,
            nightModeEnabled: Theme.of(context).brightness == Brightness.dark,
          ),
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
          Text(title),
          Text(value),
        ],
      ),
    );
  }
}