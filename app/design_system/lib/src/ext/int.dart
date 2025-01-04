
import 'package:core/core.dart';

extension IntExtension on int {

  String sumFormat() {
    final formatter = NumberFormat('#,##0.##', 'en_US');
    return formatter.format(this).replaceAll(',', ' ');
  }

}