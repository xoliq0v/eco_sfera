import 'package:flutter/material.dart';

class RouteDetailTile extends StatelessWidget {
  final String keyText;
  final String valueText;
  final bool isFirst;
  final bool isLast;

  const RouteDetailTile({
    required this.keyText,
    required this.valueText,
    this.isFirst = false,
    this.isLast = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: isFirst ? 10 : 0,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Text(keyText, style: Theme.of(context).textTheme.bodyLarge)),
            Expanded(child: Text(valueText, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.end)),
          ],
        ),
      ),
    );
  }
}