// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partner_edit_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PartnerEditDto _$PartnerEditDtoFromJson(Map<String, dynamic> json) =>
    PartnerEditDto(
      nickname: json['nickname'] as String,
      phone: json['phone'] as String,
      comment: json['comment'] as String,
    );

Map<String, dynamic> _$PartnerEditDtoToJson(PartnerEditDto instance) =>
    <String, dynamic>{
      'nickname': instance.nickname,
      'phone': instance.phone,
      'comment': instance.comment,
    };
