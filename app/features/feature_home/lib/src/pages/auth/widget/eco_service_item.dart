import 'package:design_system/design_system.dart';
import 'package:feature_home/src/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum ItemType {
  small,
  medium,
  large
}

class EcoServiceItem extends StatelessWidget {
  final double? width;
  final double? height;
  final ItemType? itemType;
  final String image;
  final Function() onClick;
  final String title;
  const EcoServiceItem({
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
    var colorScheme = Theme.of(context).colorScheme;
    return SizedBox(
      width: width ?? double.maxFinite,
      height: itemType==ItemType.large ? 300 : 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: SizedBox(
                    height: itemType == ItemType.large ? 190 : 60,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: colorScheme.cardColor,
                        borderRadius: BorderRadius.circular(itemType == ItemType.large ? 35 : 20),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  top: 0,
                  child: Padding(
                      padding: EdgeInsets.only(
                        top: itemType == ItemType.large ? 25 : 0,
                        bottom: itemType == ItemType.large ? 25 : 0,
                      ),
                    child: Image.asset(
                      image,
                      height: itemType == ItemType.large ? 120 : 80,
                    ),
                  )
                ),
              ],
            ),
          ),
          5.verticalSpace,
          Center(child: Text(title)),
        ],
      ),
    );
  }
}