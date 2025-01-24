// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partner_trash.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PartnerTrashDto _$PartnerTrashDtoFromJson(Map<String, dynamic> json) =>
    PartnerTrashDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      nameRu: json['nameRu'] as String,
      nameEn: json['nameEn'] as String,
      price: json['price'] as String,
      partnerId: (json['partnerId'] as num).toInt(),
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$PartnerTrashDtoToJson(PartnerTrashDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nameRu': instance.nameRu,
      'nameEn': instance.nameEn,
      'price': instance.price,
      'partnerId': instance.partnerId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
