import 'package:core/core.dart' hide Map;

part 'pageable_content_dto.g.dart';

@JsonSerializable(ignoreUnannotated: false, genericArgumentFactories: true)
class PageableContentDTO<T> {
  PageableContentDTO({
    required this.data,
    required this.currentPage,
    required this.perPage,
    required this.total,
    required this.lastPage,
  });

  factory PageableContentDTO.fromJson(
      Map<String, dynamic> json,
      T Function(Object? json) fromJsonT,
      ) {
    return _$PageableContentDTOFromJson(
      json,
      fromJsonT,
    );
  }

  @JsonKey(name: 'data')
  final List<T> data;
  @JsonKey(name: 'current_page')
  final int currentPage;
  @JsonKey(name: 'per_page')
  final int perPage;
  @JsonKey(name: 'total')
  final int total;
  @JsonKey(name: 'last_page')
  final int lastPage;
}
