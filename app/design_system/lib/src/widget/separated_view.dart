import 'package:core/core.dart';
import 'package:flutter/material.dart';

class ColumnSeparated extends StatelessWidget {
  const ColumnSeparated({
    required this.itemCount,
    required this.itemBuilder,
    required this.separatorBuilder,
    super.key,
  });

  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;
  final Widget Function(BuildContext, int) separatorBuilder;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(itemCount.separateChildCount(), (index) {
        final itemIndex = index ~/ 2;
        if (index.isEven) {
          return itemBuilder(context, itemIndex);
        }
        return separatorBuilder(context, itemIndex);
      }),
    );
  }
}

class RowSeparated extends StatelessWidget {
  const RowSeparated({
    required this.itemCount,
    required this.itemBuilder,
    required this.separatorBuilder,
    super.key,
  });

  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;
  final Widget Function(BuildContext, int) separatorBuilder;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(itemCount.separateChildCount(), (index) {
        final itemIndex = index ~/ 2;
        if (index.isEven) {
          return itemBuilder(context, itemIndex);
        }
        return separatorBuilder(context, itemIndex);
      }),
    );
  }
}
