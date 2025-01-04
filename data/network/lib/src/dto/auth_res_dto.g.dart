// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_res_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResDTO _$AuthResDTOFromJson(Map<String, dynamic> json) => AuthResDTO(
      token: json['token'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$AuthResDTOToJson(AuthResDTO instance) =>
    <String, dynamic>{
      'token': instance.token,
      'type': instance.type,
    };
