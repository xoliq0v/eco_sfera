import 'package:core/core.dart' hide Map;

part 'partner_dto.g.dart';

@JsonSerializable()
class PartnerDto {
  PartnerDto({
    required this.id,
    required this.title
  });

  factory PartnerDto.fromJson(Map<String, dynamic> json){
    return _$PartnerDtoFromJson(json);
  }

  final int id;
  final String title;
}