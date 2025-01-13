// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partner_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PartnerDto _$PartnerDtoFromJson(Map<String, dynamic> json) => PartnerDto(
      id: (json['id'] as num).toInt(),
      nickname: json['nickname'] as String,
      comment: json['comment'] as String,
      longitude: json['longitude'] as String,
      latitude: json['latitude'] as String,
    );

Map<String, dynamic> _$PartnerDtoToJson(PartnerDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nickname': instance.nickname,
      'comment': instance.comment,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
    };
