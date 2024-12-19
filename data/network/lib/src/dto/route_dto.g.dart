// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RouteDto _$RouteDtoFromJson(Map<String, dynamic> json) => RouteDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      number: json['number'] as String,
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
    );

Map<String, dynamic> _$RouteDtoToJson(RouteDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'number': instance.number,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
