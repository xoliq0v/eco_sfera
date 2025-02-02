// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentDto _$CommentDtoFromJson(Map<String, dynamic> json) => CommentDto(
      id: (json['id'] as num).toInt(),
      description: json['description'] as String,
      partnerProductId: (json['partner_product_id'] as num).toInt(),
      partnerProduct: PartnerProductDto.fromJson(
          json['partner_product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CommentDtoToJson(CommentDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'partner_product_id': instance.partnerProductId,
      'partner_product': instance.partnerProduct,
    };
