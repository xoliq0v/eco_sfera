import '../../core.dart' hide Map;

part 'base_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> {
  ApiResponse(
      this.data, {
        required this.success,
        this.error,
        this.message,
        this.pagination,
      });

  factory ApiResponse.fromJson(
      Map<String, dynamic> json,
      T Function(Object? data) fromJsonT,
      ) {
    final response = _$ApiResponseFromJson<T>(json, fromJsonT);

    // Handle pagination separately since it's not automatically handled by the generic serializer
    if (json['pagination'] != null) {
      response.pagination = Pagination.fromJson(json['pagination'] as Map<String, dynamic>);
    }

    return response;
  }

  final T? data;
  @JsonKey(defaultValue: false)
  bool success;
  final ApiResponseError? error;
  final String? message;
  Pagination? pagination;
}