// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerResponseDto _$CustomerResponseDtoFromJson(Map<String, dynamic> json) =>
    CustomerResponseDto(
      name: json['name'] as String,
      surname: json['surname'] as String,
      gender: json['gender'] as String,
      phone: json['phone'] as String,
      birthDate: json['birth_date'] as String,
      address: json['address'] as String,
      updatedAt: json['updated_at'] as String,
      createdAt: json['created_at'] as String,
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$CustomerResponseDtoToJson(
        CustomerResponseDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'surname': instance.surname,
      'gender': instance.gender,
      'phone': instance.phone,
      'birth_date': instance.birthDate,
      'address': instance.address,
      'updated_at': instance.updatedAt,
      'created_at': instance.createdAt,
      'id': instance.id,
    };
