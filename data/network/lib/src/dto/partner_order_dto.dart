import 'package:core/core.dart';
import 'package:network/network.dart';

part 'partner_order_dto.g.dart';

@JsonSerializable()
class PartnerOrderDto {
  final int id;
  final DriverDto driver;
  final String? phone;
  final String? comment;
  final String? totalPrice;
  final String? longitude;
  final String? latitude;
  final String? productType;
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

