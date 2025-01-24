import 'package:core/core.dart';
import 'package:network/network.dart';

part 'partner_order_dto.g.dart';

@JsonSerializable()
class PartnerOrderDto {
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
  @JsonKey(name: 'product_type')
  final String? productType;
  @JsonKey(name: 'product_weight')
  final String? productWeight;
  final String? status;
  final String? date;

  const PartnerOrderDto({
    required this.id,
    required this.driver,
    required this.phone,
    required this.comment,
    required this.totalPrice,
    required this.longitude,
    required this.latitude,
    required this.productType,
    required this.productWeight,
    required this.status,
    required this.date,
  });

  factory PartnerOrderDto.fromJson(Map<String, dynamic> json) => _$PartnerOrderDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PartnerOrderDtoToJson(this);
}

