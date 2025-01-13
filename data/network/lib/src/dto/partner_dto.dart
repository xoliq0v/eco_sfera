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
  });

  factory PartnerDto.fromJson(Map<String, dynamic> json){
    return _$PartnerDtoFromJson(json);
  }

  final int id;
  final String nickname;
  final String comment;
  final String longitude;
  final String latitude;
}