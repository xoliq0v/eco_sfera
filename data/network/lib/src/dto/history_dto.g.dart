// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryDto _$HistoryDtoFromJson(Map<String, dynamic> json) => HistoryDto(
      id: (json['id'] as num).toInt(),
      date: json['date'] as String,
      paperKg: (json['paper_kg'] as num).toInt(),
      paperPrice: json['paper_price'] as String,
      plasticKg: (json['plastic_kg'] as num).toInt(),
      plasticPrice: json['plastic_price'] as String,
      plasticBottleKg: (json['plastic_bottle_kg'] as num).toInt(),
      plasticBottlePrice: json['plastic_bottle_price'] as String,
      cartonKg: (json['carton_kg'] as num).toInt(),
      cartonPrice: json['carton_price'] as String,
      totalKg: (json['total_kg'] as num).toInt(),
      totalPrice: json['total_price'] as String,
      type: json['type'] as String,
      user: json['user'] as String?,
      location: json['location'] as String?,
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
