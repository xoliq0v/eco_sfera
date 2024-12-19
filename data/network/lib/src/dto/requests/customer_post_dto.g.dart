// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_post_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerPostDTO _$CustomerPostDTOFromJson(Map<String, dynamic> json) =>
    CustomerPostDTO(
      name: json['name'] as String,
      surname: json['surname'] as String,
      middleName: json['middle_name'] as String,
      gender: json['gender'] as String,
      phone: json['phone'] as String,
      birthDate: json['birth_date'] as String,
      address: json['address'] as String,
    );

Map<String, dynamic> _$CustomerPostDTOToJson(CustomerPostDTO instance) =>
    <String, dynamic>{
      'name': instance.name,
      'surname': instance.surname,
      'middle_name': instance.middleName,
      'gender': instance.gender,
      'phone': instance.phone,
      'birth_date': instance.birthDate,
      'address': instance.address,
    };
