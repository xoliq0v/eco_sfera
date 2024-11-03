import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerView extends StatelessWidget {
  const ShimmerView({
    required this.child,
    super.key,
    this.enable = true,
    this.loop = 5,
  });

  final Widget child;
  final bool enable;
  final int loop;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade200,
      highlightColor: Colors.white,
      loop: loop,
      period: const Duration(seconds: 2),
      enabled: enable,
      child: child,
    );
  }
}

class ShimmerViewBox extends StatelessWidget {
  const ShimmerViewBox({
    this.color = Colors.white,
    this.width,
    this.height,
    this.radius = 16,
    super.key,
  });

  final Color? color;
  final double? width;
  final double? height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius).r,
      ),
      child: SizedBox(width: width, height: height),
    );
  }
}
