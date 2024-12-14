import 'package:core/core.dart' hide Map;

part 'location_dto.g.dart';

@JsonSerializable()
class LocationDto {
  final String latitude;
  final String longitude;
  final int id;

  LocationDto({
    required this.latitude,
    required this.longitude,
    required this.id,
  });

  factory LocationDto.fromJson(Map<String, dynamic> json) => _$LocationDtoFromJson(json);
  Map<String, dynamic> toJson() => _$LocationDtoToJson(this);
}