import 'package:flutter/material.dart';
class GridTile extends StatelessWidget {
  final int columnSpan;
  final int rowSpan;
  final Widget child;

  const GridTile({
    Key? key,
    required this.columnSpan,
    required this.rowSpan,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth * columnSpan + (columnSpan - 1) * 10;
        final height = constraints.maxHeight * rowSpan + (rowSpan - 1) * 10;
        return SizedBox(
          width: width,
          height: height,
          child: child,
        );
      },
    );
  }
}