// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trash_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrashDto _$TrashDtoFromJson(Map<String, dynamic> json) => TrashDto(
      key: json['key'] as String,
      price: (json['price'] as num).toInt(),
    );

Map<String, dynamic> _$TrashDtoToJson(TrashDto instance) => <String, dynamic>{
      'key': instance.key,
      'price': instance.price,
    };
