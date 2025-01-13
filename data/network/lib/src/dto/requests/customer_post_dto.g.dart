// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_post_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerPostDTO _$CustomerPostDTOFromJson(Map<String, dynamic> json) =>
    CustomerPostDTO(
      fullName: json['fullName'] as String,
      phone: json['phone_number'] as String,
      regionId: (json['region_id'] as num).toInt(),
      address: json['full_address'] as String,
      pinfl: json['pinfl'] as String?,
    );

Map<String, dynamic> _$CustomerPostDTOToJson(CustomerPostDTO instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'phone_number': instance.phone,
      'region_id': instance.regionId,
      'full_address': instance.address,
      'pinfl': instance.pinfl,
    };
