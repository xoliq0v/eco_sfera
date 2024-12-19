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
      currentPage: (json['current_page'] as num).toInt(),
      perPage: (json['per_page'] as num).toInt(),
      total: (json['total'] as num).toInt(),
      lastPage: (json['last_page'] as num).toInt(),
    );

Map<String, dynamic> _$PageableContentDTOToJson<T>(
  PageableContentDTO<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': instance.data.map(toJsonT).toList(),
      'current_page': instance.currentPage,
      'per_page': instance.perPage,
      'total': instance.total,
      'last_page': instance.lastPage,
    };
