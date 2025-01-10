import 'package:core/core.dart' hide Map;

part 'history_dto.g.dart';

@JsonSerializable()
class HistoryDto {
  final int id;
  final String date;
  final String? user;
  final String? location;
  @JsonKey(name: 'paper_kg')
  final int paperKg;
  @JsonKey(name: 'paper_price')
  final String paperPrice;
  @JsonKey(name: 'plastic_kg')
  final int plasticKg;
  @JsonKey(name: 'plastic_price')
  final String plasticPrice;
  @JsonKey(name: 'plastic_bottle_kg')
  final int plasticBottleKg;
  @JsonKey(name: 'plastic_bottle_price')
  final String plasticBottlePrice;
  @JsonKey(name: 'carton_kg')
  final int cartonKg;
  @JsonKey(name: 'carton_price')
  final String cartonPrice;
  @JsonKey(name: 'total_kg')
  final int totalKg;
  @JsonKey(name: 'total_price')
  final String totalPrice;
  final String type;

  HistoryDto({
    required this.id,
    required this.date,
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
    this.user,
    this.location,
  });

  factory HistoryDto.fromJson(Map<String, dynamic> json) => _$HistoryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryDtoToJson(this);
}
