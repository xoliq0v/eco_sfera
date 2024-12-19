import 'package:core/core.dart' hide Map;
import 'package:intl/intl.dart';
import 'package:network/src/dto/order_user_dto.dart';

import 'location_dto.dart';

part 'order_dto.g.dart';

@JsonSerializable()
class OrderDto {
  const OrderDto({
    required this.totalKg,
    required this.totalPrice,
    required this.date,
    required this.id,
    required this.user,
    this.locations = const []
  });

  factory OrderDto.fromJson(Map<String, dynamic> json) => _$OrderDtoFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDtoToJson(this);

  @JsonKey(name: 'total_kg')
  final int totalKg;

  @JsonKey(name: 'total_price')
  final String totalPrice;

  @JsonKey(
    name: 'date',
    fromJson: _dateFromJson,
    toJson: _dateToJson,
  )
  final DateTime date;

  final int id;

  final List<LocationDto> locations;

  final OrderUserDto user;

  // Custom DateTime parsing function
  static DateTime _dateFromJson(String date) {
    return DateFormat('dd.MM.yyyy HH:mm').parse(date);
  }

  // Custom DateTime formatting function
  static String _dateToJson(DateTime date) {
    return DateFormat('dd.MM.yyyy HH:mm').format(date);
  }
}
