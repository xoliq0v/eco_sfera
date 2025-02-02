import 'package:core/core.dart';

part 'partner_trash.g.dart';

@JsonSerializable()
class PartnerTrashDto {

  const PartnerTrashDto({
    required this.id,
    required this.name,
    required this.nameRu,
    required this.nameEn,
    required this.price,
    required this.partnerId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PartnerTrashDto.fromJson(Map<String, dynamic> json) => _$PartnerTrashDtoFromJson(json);
  final int id;
  final String name;
  final String nameRu;
  final String nameEn;
  final String price;
  final int partnerId;
  final String createdAt;
  final String updatedAt;
  Map<String, dynamic> toJson() => _$PartnerTrashDtoToJson(this);
}