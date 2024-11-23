// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthDTO _$AuthDTOFromJson(Map<String, dynamic> json) => AuthDTO(
      login: json['login'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$AuthDTOToJson(AuthDTO instance) => <String, dynamic>{
      'login': instance.login,
      'password': instance.password,
    };
