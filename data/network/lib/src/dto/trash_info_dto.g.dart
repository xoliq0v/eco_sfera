// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trash_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrashInfoDto _$TrashInfoDtoFromJson(Map<String, dynamic> json) => TrashInfoDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      nameRu: json['name_ru'] as String,
      nameKr: json['name_kr'] as String,
      key: json['key'] as String,
      price: json['price'] as String,
    );

Map<String, dynamic> _$TrashInfoDtoToJson(TrashInfoDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'name_ru': instance.nameRu,
      'name_kr': instance.nameKr,
      'key': instance.key,
      'price': instance.price,
    };
