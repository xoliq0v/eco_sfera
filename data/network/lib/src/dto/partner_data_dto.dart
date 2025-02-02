import 'package:core/core.dart';

part 'partner_data_dto.g.dart';

@JsonSerializable()
class PartnerDataDto {

  const PartnerDataDto({
    required this.id,
    required this.comment,
    required this.nickname,
    required this.longitude,
    required this.latitude,
  });

  factory PartnerDataDto.fromJson(Map<String, dynamic> json) => _$PartnerDataDtoFromJson(json);
  final int? id;
  final String? comment;
  final String? nickname;
  final String? longitude;
  final String? latitude;
  Map<String, dynamic> toJson() => _$PartnerDataDtoToJson(this);
}
