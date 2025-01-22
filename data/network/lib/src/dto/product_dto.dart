
import 'package:core/core.dart';

part 'product_dto.g.dart';

@JsonSerializable()
class ProductDto {
  final int id;
  final String? name;
  @JsonKey(name: 'name_ru')
  final String? nameRu;
  @JsonKey(name: 'name_en')
  final String? nameEn;
  final String? price;
  @JsonKey(name: 'partner_id')
  final int? partnerId;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  const ProductDto({
    required this.id,
    required this.name,
    required this.nameRu,
    required this.nameEn,
    required this.price,
    required this.partnerId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProductDto.fromJson(Map<String, dynamic> json) => _$ProductDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ProductDtoToJson(this);
}
