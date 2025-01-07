// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pageable_content_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageableContentDTO<T> _$PageableContentDTOFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    PageableContentDTO<T>(
      data: (json['data'] as List<dynamic>).map(fromJsonT).toList(),
      currentPage: (json['currentPage'] as num).toInt(),
      perPage: (json['perPage'] as num).toInt(),
      total: (json['total'] as num).toInt(),
      lastPage: (json['lastPage'] as num).toInt(),
    );

Map<String, dynamic> _$PageableContentDTOToJson<T>(
  PageableContentDTO<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': instance.data.map(toJsonT).toList(),
      'currentPage': instance.currentPage,
      'perPage': instance.perPage,
      'total': instance.total,
      'lastPage': instance.lastPage,
    };
