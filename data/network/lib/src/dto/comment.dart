import 'package:core/core.dart';
import 'package:network/network.dart';

part 'comment.g.dart';

@JsonSerializable()
class CommentDto {

  const CommentDto({
    required this.id,
    required this.description,
    required this.partnerProductId,
    required this.partnerProduct,
  });

  factory CommentDto.fromJson(Map<String, dynamic> json) => _$CommentDtoFromJson(json);
  final int id;
  final String description;
  @JsonKey(name: 'partner_product_id')
  final int partnerProductId;
  @JsonKey(name: 'partner_product')
  final PartnerProductDto partnerProduct;
  Map<String, dynamic> toJson() => _$CommentDtoToJson(this);
}