import 'package:core/core.dart' hide Map;

part 'base_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> {
  ApiResponse(
    this.data, {
    required this.success,
    this.error,
  });

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? data) fromJsonT,
  ) {
    return _$ApiResponseFromJson<T>(json, fromJsonT);
  }

  final T? data;
  @JsonKey(defaultValue: false)
  bool success;
  final ApiResponseError? error;
}
