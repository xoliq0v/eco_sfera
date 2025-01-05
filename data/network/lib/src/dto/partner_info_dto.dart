
import 'package:core/core.dart';

part 'partner_info_dto.g.dart';

@JsonSerializable()
class PartnerInfoDto {

  const PartnerInfoDto({
    required this.id,
    required this.latitude,
    required this.longitude,
    this.location,
    required this.createdAt,
    required this.updatedAt,
    required this.province,
    required this.district,
    required this.address,
    required this.isActive,
    required this.status,
    required this.nickname,
    required this.fish,
    required this.comment,
    required this.login,
    required this.password,
    required this.trashes,
    required this.trashePrices,
    this.phone,
  });

  // Factory for deserialization
  factory PartnerInfoDto.fromJson(Map<String, dynamic> json) =>
      _$PartnerInfoDtoFromJson(json);

  final int id;
  final String latitude;
  final String longitude;
  final String? location;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  final String province;
  final String district;
  final String address;
  @JsonKey(name: 'is_active')
  final bool isActive;
  final bool status;
  final String nickname;
  final String fish;
  final String comment;
  final String login;
  final String password;
  final String trashes;
  @JsonKey(name: 'trashe_prices')
  final String trashePrices;
  final String? phone;

  // Method for serialization
  Map<String, dynamic> toJson() => _$PartnerInfoDtoToJson(this);
}