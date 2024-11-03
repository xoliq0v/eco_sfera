import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  String customFormat(String format) {
    final formatter = DateFormat(format);
    return formatter.format(this);
  }
}
