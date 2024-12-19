import 'package:core/core.dart' hide Map;

part 'history_dto.g.dart';

@JsonSerializable()
class HistoryDto {
  final int id;
  final String employee;

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

  HistoryDto({
    required this.id,
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

  // Factory method to create an instance from JSON
  factory HistoryDto.fromJson(Map<String, dynamic> json) => _$HistoryDtoFromJson(json);

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() => _$HistoryDtoToJson(this);
}
