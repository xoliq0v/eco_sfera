import 'package:core/core.dart';

part 'buy_req_dto.g.dart';

@JsonSerializable()
class BuyReqDto{

  const BuyReqDto({
    required this.employee,
    required this.userOrderId,
    required this.customerId,
    required this.paperKg,
    required this.paperPrice,
    required this.plasticKg,
    required this.plasticPrice,
    required this.plasticBottleKg,
    required this.plasticBottlePrice,
    required this.cartonKg,
    required this.cartonPrice,
    required this.totalKg,
    required this.totalPrice,
    required this.type,
  });

  final String employee;
  @JsonKey(name: 'user_order_id')
  final int userOrderId;
  @JsonKey(name: 'customer_id')
  final int customerId;
  @JsonKey(name: 'paper_kg')
  final double paperKg;
  @JsonKey(name: 'paper_price')
  final double paperPrice;
  @JsonKey(name: 'plastic_kg')
  final double plasticKg;
  @JsonKey(name: 'plastic_price')
  final double plasticPrice;
  @JsonKey(name: 'plastic_bottle_kg')
  final double plasticBottleKg;
  @JsonKey(name: 'plastic_bottle_price')
  final double plasticBottlePrice;
  @JsonKey(name: 'carton_kg')
  final double cartonKg;
  @JsonKey(name: 'carton_price')
  final double cartonPrice;
  @JsonKey(name: 'total_kg')
  final double totalKg;
  @JsonKey(name: 'total_price')
  final double totalPrice;
  final String type;

  Map<String, dynamic> toJson() => _$BuyReqDtoToJson(this);

}