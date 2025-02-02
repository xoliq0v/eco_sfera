import 'package:core/core.dart' hide Map;

part 'pageable_content_dto.g.dart';

@JsonSerializable(genericArgumentFactories: true)
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
    final items = (json['data'] as List)
        .map((item) => fromJsonT(item))
        .toList();

    return PageableContentDTO<T>(
      data: items,
      currentPage: json['current_page'] as int? ?? 1,
      perPage: json['per_page'] as int? ?? 10,
      total: json['total'] as int? ?? 0,
      lastPage: json['last_page'] as int? ?? 1,
    );
  }

  final List<T> data;
  final int currentPage;
  final int perPage;
  final int total;
  final int lastPage;
}