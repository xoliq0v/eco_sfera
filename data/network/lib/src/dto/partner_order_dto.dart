import 'package:core/core.dart';
import 'package:network/network.dart';

part 'partner_order_dto.g.dart';

@JsonSerializable()
class PartnerOrderDto {

  const PartnerOrderDto({
    required this.id,
    required this.driver,
    required this.phone,
    required this.comment,
    required this.totalPrice,
    required this.longitude,
    required this.latitude,
    required this.products,
    required this.status,
    required this.date,
  });

  factory PartnerOrderDto.fromJson(Map<String, dynamic> json) => _$PartnerOrderDtoFromJson(json);
  final int id;
  final DriverDto driver;
  final String? phone;
  final String? comment;
  @JsonKey(name: 'total_price')
  final String? totalPrice;
  @JsonKey(name: 'longitude')
  final String? longitude;
  @JsonKey(name: 'latitude')
  final String? latitude;
  @JsonKey(name: 'products')
  final List<PartnerOrderDtoItem>? products;
  final String? status;
  final String? date;
  Map<String, dynamic> toJson() => _$PartnerOrderDtoToJson(this);
}



@JsonSerializable()
class PartnerOrderDtoItem {
  @JsonKey(name: 'product_uz')
  final String productUz;

  @JsonKey(name: 'product_en')
  final String? productEn;

  @JsonKey(name: 'product_ru')
  final String productRu;

  @JsonKey(name: 'product_weight')
  final String productWeight;

  PartnerOrderDtoItem({
    required this.productUz,
    this.productEn,
    required this.productRu,
    required this.productWeight,
  });

  // Factory constructor for JSON deserialization
  factory PartnerOrderDtoItem.fromJson(Map<String, dynamic> json) => _$PartnerOrderDtoItemFromJson(json);

  // Method for JSON serialization
  Map<String, dynamic> toJson() => _$PartnerOrderDtoItemToJson(this);
}