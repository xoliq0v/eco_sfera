import 'package:core/core.dart' hide Map;

part 'route_dto.g.dart';

@JsonSerializable()
class RouteDto {
  RouteDto({
    required this.id,
    required this.name,
    required this.number,
    required this.latitude,
    required this.longitude,
  });

  factory RouteDto.fromJson(Map<String, dynamic> json){
    return _$RouteDtoFromJson(json);
  }

  final int id;
  final String name;
  final String number;
  final String latitude;
  final String longitude;
}