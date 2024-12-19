// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerDto _$CustomerDtoFromJson(Map<String, dynamic> json) => CustomerDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$CustomerDtoToJson(CustomerDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
