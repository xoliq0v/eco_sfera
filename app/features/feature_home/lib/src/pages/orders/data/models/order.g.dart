// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderImpl _$$OrderImplFromJson(Map<String, dynamic> json) => _$OrderImpl(
      title: json['title'] as String,
      description: json['description'] as String,
      distance: json['distance'] as String,
      date: json['date'] as String,
      fromLocation: json['fromLocation'] as String,
    );

Map<String, dynamic> _$$OrderImplToJson(_$OrderImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'distance': instance.distance,
      'date': instance.date,
      'fromLocation': instance.fromLocation,
    };
