// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryDto _$HistoryDtoFromJson(Map<String, dynamic> json) => HistoryDto(
      id: (json['id'] as num?)?.toInt(),
      date: json['date'] as String?,
      paperKg: json['paper_kg'] as String?,
      paperPrice: json['paper_price'] as String?,
      plasticKg: json['plastic_kg'] as String?,
      plasticPrice: json['plastic_price'] as String?,
      plasticBottleKg: json['plastic_bottle_kg'] as String?,
      plasticBottlePrice: json['plastic_bottle_price'] as String?,
      cartonKg: json['carton_kg'] as String?,
      cartonPrice: json['carton_price'] as String?,
      totalKg: json['total_kg'] as String?,
      totalPrice: json['total_price'] as String?,
      type: json['type'] as String?,
      user: json['user'] == null
          ? null
          : UserDto.fromJson(json['user'] as Map<String, dynamic>),
      location: json['location'] == null
          ? null
          : LocationDto.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HistoryDtoToJson(HistoryDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'user': instance.user,
      'location': instance.location,
      'paper_kg': instance.paperKg,
      'paper_price': instance.paperPrice,
      'plastic_kg': instance.plasticKg,
      'plastic_price': instance.plasticPrice,
      'plastic_bottle_kg': instance.plasticBottleKg,
      'plastic_bottle_price': instance.plasticBottlePrice,
      'carton_kg': instance.cartonKg,
      'carton_price': instance.cartonPrice,
      'total_kg': instance.totalKg,
      'total_price': instance.totalPrice,
      'type': instance.type,
    };
