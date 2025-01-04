import 'package:json_annotation/json_annotation.dart';

part 'customer_response_dto.g.dart';

@JsonSerializable()
class CustomerResponseDto {
  final String name;
  final String surname;
  final String gender;
  final String phone;
  @JsonKey(name: 'birth_date')
  final String birthDate;
  final String address;
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @JsonKey(name: 'created_at')
  final String createdAt;
  final int id;

  CustomerResponseDto({
    required this.name,
    required this.surname,
    required this.gender,
    required this.phone,
    required this.birthDate,
    required this.address,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  /// Factory method for creating a `UserDto` from JSON.
  factory CustomerResponseDto.fromJson(Map<String, dynamic> json) => _$CustomerResponseDtoFromJson(json);

  /// Converts `UserDto` to JSON.
  Map<String, dynamic> toJson() => _$CustomerResponseDtoToJson(this);
}
