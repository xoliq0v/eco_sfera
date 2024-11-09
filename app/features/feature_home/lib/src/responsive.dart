import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget tablet;
  final Widget mobile;
  const Responsive({super.key,required this.mobile,required this.tablet});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 600) {
          return tablet;
        } else {
          return mobile;
        }
      },
    );
  }
}
