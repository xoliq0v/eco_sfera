// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegionDTO _$RegionDTOFromJson(Map<String, dynamic> json) => RegionDTO(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$RegionDTOToJson(RegionDTO instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
