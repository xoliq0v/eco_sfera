// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_get_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerGetRequestDTO _$CustomerGetRequestDTOFromJson(
        Map<String, dynamic> json) =>
    CustomerGetRequestDTO(
      size: (json['size'] as num).toInt(),
      page: (json['page'] as num).toInt(),
    );

Map<String, dynamic> _$CustomerGetRequestDTOToJson(
        CustomerGetRequestDTO instance) =>
    <String, dynamic>{
      'page': instance.page,
      'size': instance.size,
    };
