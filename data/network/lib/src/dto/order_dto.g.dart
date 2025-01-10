// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDto _$OrderDtoFromJson(Map<String, dynamic> json) => OrderDto(
      totalKg: (json['total_kg'] as num).toInt(),
      totalPrice: json['total_price'] as String,
      date: OrderDto._dateFromJson(json['date'] as String),
      id: (json['id'] as num).toInt(),
      user: OrderUserDto.fromJson(json['user'] as Map<String, dynamic>),
      items: (json['items'] as List<dynamic>)
          .map((e) => OrderItemDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String,
      locations: (json['locations'] as List<dynamic>?)
              ?.map((e) => LocationDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$OrderDtoToJson(OrderDto instance) => <String, dynamic>{
      'total_kg': instance.totalKg,
      'total_price': instance.totalPrice,
      'date': OrderDto._dateToJson(instance.date),
      'id': instance.id,
      'locations': instance.locations,
      'user': instance.user,
      'items': instance.items,
      'status': instance.status,
    };

OrderItemDTO _$OrderItemDTOFromJson(Map<String, dynamic> json) => OrderItemDTO(
      name: json['name'] as String?,
      price: json['price'] as String?,
    );

Map<String, dynamic> _$OrderItemDTOToJson(OrderItemDTO instance) =>
    <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
    };
