import 'package:core/core.dart';

part 'partner_edit_dto.g.dart';

@JsonSerializable()
class PartnerEditDto {
  final String nickname;
  final String phone;
  final String comment;

  const PartnerEditDto({
    required this.nickname,
    required this.phone,
    required this.comment,
  });

  factory PartnerEditDto.fromJson(Map<String, dynamic> json) => _$PartnerEditDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PartnerEditDtoToJson(this);
}