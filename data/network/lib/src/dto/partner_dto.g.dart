// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partner_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PartnerDto _$PartnerDtoFromJson(Map<String, dynamic> json) => PartnerDto(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
    );

Map<String, dynamic> _$PartnerDtoToJson(PartnerDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };
