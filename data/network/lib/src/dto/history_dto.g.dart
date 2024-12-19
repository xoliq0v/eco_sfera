// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryDto _$HistoryDtoFromJson(Map<String, dynamic> json) => HistoryDto(
      id: (json['id'] as num).toInt(),
      employee: json['employee'] as String,
      customerId: (json['customer_id'] as num).toInt(),
      paperKg: (json['paper_kg'] as num).toDouble(),
      paperPrice: (json['paper_price'] as num).toDouble(),
      plasticKg: (json['plastic_kg'] as num).toDouble(),
      plasticPrice: (json['plastic_price'] as num).toDouble(),
      plasticBottleKg: (json['plastic_bottle_kg'] as num).toDouble(),
      plasticBottlePrice: (json['plastic_bottle_price'] as num).toDouble(),
      cartonKg: (json['carton_kg'] as num).toDouble(),
      cartonPrice: (json['carton_price'] as num).toDouble(),
      totalKg: (json['total_kg'] as num).toDouble(),
      totalPrice: (json['total_price'] as num).toDouble(),
      type: json['type'] as String,
    );

Map<String, dynamic> _$HistoryDtoToJson(HistoryDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'employee': instance.employee,
      'customer_id': instance.customerId,
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
