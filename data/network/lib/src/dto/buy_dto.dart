import 'package:core/core.dart' hide Map;

part 'buy_dto.g.dart';

@JsonSerializable()
class BuyDto {

  final String employee;
  @JsonKey(name: 'customer_id')
  final int customerId;
  @JsonKey(name: 'customer_kg')
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

  BuyDto({
    required this.employee,
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

  factory BuyDto.fromJson(Map<String, dynamic> json) => _$BuyDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BuyDtoToJson(this);
}