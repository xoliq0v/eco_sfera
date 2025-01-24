// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partner_order_driver_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DriverDto _$DriverDtoFromJson(Map<String, dynamic> json) => DriverDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
    );

Map<String, dynamic> _$DriverDtoToJson(DriverDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
    };
