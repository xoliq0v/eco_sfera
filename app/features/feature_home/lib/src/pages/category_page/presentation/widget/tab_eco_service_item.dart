import 'package:design_system/design_system.dart';
import 'eco_service_item.dart';
import 'package:flutter/material.dart';


class TabEcoServiceItem extends StatelessWidget {
  final double? width;
  final double? height;
  final ItemType? itemType;
  final String image;
  final Function() onClick;
  final String title;
  const TabEcoServiceItem({
    super.key,
    this.itemType,
    this.width,
    this.height,
    required this.image,
    required this.onClick,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: itemType==ItemType.large ? 300 : 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: context.colorScheme.cardColor,
              borderRadius: BorderRadius.circular(20)
            ),
            child: Padding(
              padding: itemType == ItemType.large ? EdgeInsets.all(20.0) : EdgeInsets.all(0),
              child: Image.asset(
                image,
                height: itemType == ItemType.large ? 200 : 110,
              ),
            ),
          ),
          5.verticalSpace,
          Center(child: Text(title)),
        ],
      ),
    );
  }
}