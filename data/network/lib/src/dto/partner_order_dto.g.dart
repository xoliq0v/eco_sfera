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
      totalPrice: json['totalPrice'] as String?,
      longitude: json['longitude'] as String?,
      latitude: json['latitude'] as String?,
      productType: json['productType'] as String?,
      productWeight: json['productWeight'] as String?,
      status: json['status'] as String?,
      date: json['date'] as String?,
    );

Map<String, dynamic> _$PartnerOrderDtoToJson(PartnerOrderDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'driver': instance.driver,
      'phone': instance.phone,
      'comment': instance.comment,
      'totalPrice': instance.totalPrice,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'productType': instance.productType,
      'productWeight': instance.productWeight,
      'status': instance.status,
      'date': instance.date,
    };
