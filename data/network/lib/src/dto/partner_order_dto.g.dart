// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partner_order_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PartnerOrderDto _$PartnerOrderDtoFromJson(Map<String, dynamic> json) =>
    PartnerOrderDto(
      id: (json['id'] as num).toInt(),
      driver: DriverDto.fromJson(json['driver'] as Map<String, dynamic>),
      phone: json['phone'] as String?,
      comment: json['comment'] as String?,
      totalPrice: json['total_price'] as String?,
      longitude: json['longitude'] as String?,
      latitude: json['latitude'] as String?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => PartnerOrderDtoItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
      date: json['date'] as String?,
    );

Map<String, dynamic> _$PartnerOrderDtoToJson(PartnerOrderDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'driver': instance.driver,
      'phone': instance.phone,
      'comment': instance.comment,
      'total_price': instance.totalPrice,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'products': instance.products,
      'status': instance.status,
      'date': instance.date,
    };

PartnerOrderDtoItem _$PartnerOrderDtoItemFromJson(Map<String, dynamic> json) =>
    PartnerOrderDtoItem(
      productUz: json['product_uz'] as String,
      productEn: json['product_en'] as String?,
      productRu: json['product_ru'] as String,
      productWeight: json['product_weight'] as String,
    );

Map<String, dynamic> _$PartnerOrderDtoItemToJson(
        PartnerOrderDtoItem instance) =>
    <String, dynamic>{
      'product_uz': instance.productUz,
      'product_en': instance.productEn,
      'product_ru': instance.productRu,
      'product_weight': instance.productWeight,
    };
