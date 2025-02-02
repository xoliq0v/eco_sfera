// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submission_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubmissionDto _$SubmissionDtoFromJson(Map<String, dynamic> json) =>
    SubmissionDto(
      driverName: json['driver_name'] as String,
      partnerId: (json['partner_id'] as num).toInt(),
      comment: json['comment'] as String,
      longitude: json['longitude'] as String,
      latitude: json['latitude'] as String,
      products: (json['products'] as List<dynamic>)
          .map((e) => SubmissionDtoItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubmissionDtoToJson(SubmissionDto instance) =>
    <String, dynamic>{
      'driver_name': instance.driverName,
      'partner_id': instance.partnerId,
      'products': instance.products,
      'comment': instance.comment,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
    };

SubmissionDtoItem _$SubmissionDtoItemFromJson(Map<String, dynamic> json) =>
    SubmissionDtoItem(
      trashId: json['trash_id'] as String,
      volume: json['volume'] as String,
    );

Map<String, dynamic> _$SubmissionDtoItemToJson(SubmissionDtoItem instance) =>
    <String, dynamic>{
      'trash_id': instance.trashId,
      'volume': instance.volume,
    };
