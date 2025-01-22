// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partner_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PartnerInfoDto _$PartnerInfoDtoFromJson(Map<String, dynamic> json) =>
    PartnerInfoDto(
      id: (json['id'] as num).toInt(),
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      location: json['location'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      province: json['province'] as String?,
      district: json['district'] as String?,
      address: json['address'] as String?,
      isActive: json['is_active'] as bool?,
      status: json['status'] as bool?,
      nickname: json['nickname'] as String?,
      fish: json['fish'] as String?,
      comment: json['comment'] as String?,
      login: json['login'] as String?,
      password: json['password'] as String?,
      trashes: json['trashes'] as String?,
      trashePrices: json['trashe_prices'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$PartnerInfoDtoToJson(PartnerInfoDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'location': instance.location,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'province': instance.province,
      'district': instance.district,
      'address': instance.address,
      'is_active': instance.isActive,
      'status': instance.status,
      'nickname': instance.nickname,
      'fish': instance.fish,
      'comment': instance.comment,
      'login': instance.login,
      'password': instance.password,
      'trashes': instance.trashes,
      'trashe_prices': instance.trashePrices,
      'phone': instance.phone,
    };
