// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partner_product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PartnerProductDto _$PartnerProductDtoFromJson(Map<String, dynamic> json) =>
    PartnerProductDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      nameRu: json['name_ru'] as String,
      nameEn: json['name_en'] as String,
      price: json['price'] as String,
      partnerId: (json['partner_id'] as num).toInt(),
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$PartnerProductDtoToJson(PartnerProductDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'name_ru': instance.nameRu,
      'name_en': instance.nameEn,
      'price': instance.price,
      'partner_id': instance.partnerId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
