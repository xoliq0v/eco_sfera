// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcement_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnnouncementDto _$AnnouncementDtoFromJson(Map<String, dynamic> json) =>
    AnnouncementDto(
      number: json['number'] as String,
      workTime: json['work_time'] as String,
      description: json['description'] as String,
      products: (json['products'] as List<dynamic>)
          .map((e) => AdTrashDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AnnouncementDtoToJson(AnnouncementDto instance) =>
    <String, dynamic>{
      'number': instance.number,
      'work_time': instance.workTime,
      'description': instance.description,
      'products': instance.products,
    };

AdTrashDto _$AdTrashDtoFromJson(Map<String, dynamic> json) => AdTrashDto(
      trashId: (json['trash_id'] as num).toInt(),
      price: (json['price'] as num).toInt(),
    );

Map<String, dynamic> _$AdTrashDtoToJson(AdTrashDto instance) =>
    <String, dynamic>{
      'trash_id': instance.trashId,
      'price': instance.price,
    };
