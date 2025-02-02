// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partner_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PartnerDataDto _$PartnerDataDtoFromJson(Map<String, dynamic> json) =>
    PartnerDataDto(
      id: (json['id'] as num?)?.toInt(),
      comment: json['comment'] as String?,
      nickname: json['nickname'] as String?,
      longitude: json['longitude'] as String?,
      latitude: json['latitude'] as String?,
    );

Map<String, dynamic> _$PartnerDataDtoToJson(PartnerDataDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'comment': instance.comment,
      'nickname': instance.nickname,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
    };
