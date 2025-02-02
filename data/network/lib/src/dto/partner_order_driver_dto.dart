import 'package:core/core.dart';

part 'partner_order_driver_dto.g.dart';

@JsonSerializable()
class DriverDto {

  const DriverDto({
    required this.id,
    required this.name,
    required this.phoneNumber,
  });

  factory DriverDto.fromJson(Map<String, dynamic> json) => _$DriverDtoFromJson(json);
  final int id;
  final String? name;
  final String? phoneNumber;
  Map<String, dynamic> toJson() => _$DriverDtoToJson(this);
}
