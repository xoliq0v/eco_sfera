// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderUserDto _$OrderUserDtoFromJson(Map<String, dynamic> json) => OrderUserDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      phoneNumber: json['phone_number'] as String?,
    );

Map<String, dynamic> _$OrderUserDtoToJson(OrderUserDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone_number': instance.phoneNumber,
    };
