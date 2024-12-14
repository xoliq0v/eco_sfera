import 'package:core/core.dart' hide Map;

import 'location_dto.dart';

part 'order_dto.g.dart';

@JsonSerializable()
class OrderDto {

  const OrderDto({
    required this.isSent,
    required this.totalKg,
    required this.totalPrice,
    required this.date,
    required this.id,
    required this.locationId,
    required this.userId,
    required this.locations,
  });

  factory OrderDto.fromJson(Map<String, dynamic> json) => _$OrderDtoFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDtoToJson(this);

  final bool isSent;
  final int totalKg;
  final String totalPrice;
  final DateTime date;
  final int id;
  final int locationId;
  final String userId;
  final List<LocationDto> locations;

}
