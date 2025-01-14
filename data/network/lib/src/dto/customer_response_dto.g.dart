// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerResponseDto _$CustomerResponseDtoFromJson(Map<String, dynamic> json) =>
    CustomerResponseDto(
      fullName: json['full_name'] as String,
      phone: json['phone_number'] as String,
      id: (json['id'] as num).toInt(),
      regionId: (json['region_id'] as num).toInt(),
      isApproved: json['is_approved'] as bool,
      isRegistered: json['is_registered'] as bool,
      isVerified: json['is_verified'] as bool,
      fullAddress: json['full_address'] as String,
    );

Map<String, dynamic> _$CustomerResponseDtoToJson(
        CustomerResponseDto instance) =>
    <String, dynamic>{
      'full_name': instance.fullName,
      'phone_number': instance.phone,
      'full_address': instance.fullAddress,
      'is_approved': instance.isApproved,
      'is_registered': instance.isRegistered,
      'is_verified': instance.isVerified,
      'region_id': instance.regionId,
      'id': instance.id,
    };
