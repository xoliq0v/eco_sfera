import 'package:core/core.dart';

part 'partner_product_dto.g.dart';

@JsonSerializable()
class PartnerProductDto {

  const PartnerProductDto({
    required this.id,
    required this.name,
    required this.nameRu,
    required this.nameEn,
    required this.price,
    required this.partnerId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PartnerProductDto.fromJson(Map<String, dynamic> json) => _$PartnerProductDtoFromJson(json);
  final int id;
  final String name;
  @JsonKey(name: 'name_ru') 
  final String nameRu;
  @JsonKey(name: 'name_en')
  final String nameEn;
  final String price;
  @JsonKey(name: 'partner_id')
  final int partnerId;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  Map<String, dynamic> toJson() => _$PartnerProductDtoToJson(this);
}
