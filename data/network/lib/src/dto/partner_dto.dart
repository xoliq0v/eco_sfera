import 'package:core/core.dart' hide Map;

part 'partner_dto.g.dart';

@JsonSerializable()
class PartnerDto {
  PartnerDto({
    required this.id,
    required this.nickname,
    required this.comment,
    required this.longitude,
    required this.latitude,
    this.phone,
    this.fish,
    this.status,
    this.profileImage,
    this.earnings,
    this.outlay,
    this.walletId,
    this.walletBalance,
  });

  factory PartnerDto.fromJson(Map<String, dynamic> json) {
    return _$PartnerDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PartnerDtoToJson(this);

  final int id;

  @JsonKey(name: 'nickname')
  final String? nickname;

  @JsonKey(name: 'about')
  final String? comment;

  @JsonKey(name: 'longitude')
  final String? longitude;

  @JsonKey(name: 'latitude')
  final String? latitude;

  @JsonKey(name: 'phone')
  final String? phone;

  @JsonKey(name: 'fish')
  final String? fish;

  @JsonKey(name: 'status')
  final bool? status;

  @JsonKey(name: 'profile_image')
  final String? profileImage;

  @JsonKey(name: 'earnings')
  final String? earnings;

  @JsonKey(name: 'outlay')
  final String? outlay;

  @JsonKey(name: 'wallet_id')
  final String? walletId;

  @JsonKey(name: 'wallet_balance')
  final String? walletBalance;
}