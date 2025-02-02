import 'package:core/core.dart' hide Map;

import 'package:network/network.dart';

part 'history_dto.g.dart';

@JsonSerializable()
class HistoryDto {

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
    required this.user,
    required this.location,
  });

  factory HistoryDto.fromJson(Map<String, dynamic> json) => _$HistoryDtoFromJson(json);
  final int? id;
  final String? date;
  final UserDto? user;
  final LocationDto? location;
  @JsonKey(name: 'paper_kg')
  final String? paperKg;
  @JsonKey(name: 'paper_price')
  final String? paperPrice;
  @JsonKey(name: 'plastic_kg')
  final String? plasticKg;
  @JsonKey(name: 'plastic_price')
  final String? plasticPrice;
  @JsonKey(name: 'plastic_bottle_kg')
  final String? plasticBottleKg;
  @JsonKey(name: 'plastic_bottle_price')
  final String? plasticBottlePrice;
  @JsonKey(name: 'carton_kg')
  final String? cartonKg;
  @JsonKey(name: 'carton_price')
  final String? cartonPrice;
  @JsonKey(name: 'total_kg')
  final String? totalKg;
  @JsonKey(name: 'total_price')
  final String? totalPrice;
  final String? type;

  Map<String, dynamic> toJson() => _$HistoryDtoToJson(this);
}
