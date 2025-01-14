import 'package:json_annotation/json_annotation.dart';

part 'customer_response_dto.g.dart';

@JsonSerializable()
class CustomerResponseDto {
  @JsonKey(name: 'full_name')
  final String fullName;
  @JsonKey(name: 'phone_number')
  final String phone;
  @JsonKey(name: 'full_address')
  final String fullAddress;
  @JsonKey(name: 'is_approved')
  final bool isApproved;
  @JsonKey(name: 'is_registered')
  final bool isRegistered;
  @JsonKey(name: 'is_verified')
  final bool isVerified;
  @JsonKey(name: 'region_id')
  final int regionId;
  final int id;

  CustomerResponseDto({
    required this.fullName,
    required this.phone,
    required this.id,
    required this.regionId,
    required this.isApproved,
    required this.isRegistered,
    required this.isVerified,
    required this.fullAddress,
  });

  /// Factory method for creating a `UserDto` from JSON.
  factory CustomerResponseDto.fromJson(Map<String, dynamic> json) => _$CustomerResponseDtoFromJson(json);

  /// Converts `UserDto` to JSON.
  Map<String, dynamic> toJson() => _$CustomerResponseDtoToJson(this);
}
