import 'dart:math' as math;

import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

extension NumExt on num {
  String toFormattedCurrency({
    int mantissaLength = 0,
    bool withBillion = false,
    String? currencyShortKey,
  }) {
    final result = toCurrencyString(
      '$this',
      mantissaLength: mantissaLength,
      thousandSeparator: ThousandSeparator.Space,
      trailingSymbol: currencyShortKey != null ? ' $currencyShortKey' : '',
    );

    return result;
  }
}

extension IntExt on int {
  int separateChildCount() {
    return math.max(0, this * 2 - 1);
  }
}

extension DoubleExt on double {
  int discount(double originalPrice) {
    if (originalPrice == 0) return 0;
    return (((originalPrice - this) / originalPrice) * 100).round();
  }
}
