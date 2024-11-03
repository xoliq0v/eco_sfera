import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class YellowPriceBox extends StatelessWidget {
  const YellowPriceBox({required this.price, super.key});

  final String price;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.green,
        borderRadius: AppDesignConstants.radius8,
      ),
      child: Padding(
        padding: REdgeInsets.symmetric(
          vertical: 4,
          horizontal: 8,
        ),
        child: const Text(
          LocaleKeys.appName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextConstants.style15W700,
        ).tr(namedArgs: {'price': price}, context: context),
      ),
    );
  }
}

class CustomDecorationBoxAll extends StatelessWidget {
  const CustomDecorationBoxAll({
    required this.child,
    required this.color,
    required this.padding,
    this.radius = 8,
    this.borderRadius,
    this.boxShadow,
    super.key,
  });

  final Color color;
  final Widget child;
  final EdgeInsetsGeometry padding;
  final double radius;
  final BorderRadiusGeometry? borderRadius;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius ?? BorderRadius.circular(radius).r,
        boxShadow: boxShadow,
      ),
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}
