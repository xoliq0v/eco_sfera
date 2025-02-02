import 'package:core/core.dart';

import 'package:network/network.dart';

part 'active_history_dto.g.dart';

@JsonSerializable()
class ActiveHistoryDto {

  const ActiveHistoryDto({
    required this.id,
    required this.user,
    required this.locations,
    required this.items,
    required this.status,
    required this.totalPrice,
    required this.totalKg,
    this.date,
  });

  factory ActiveHistoryDto.fromJson(Map<String, dynamic> json) => _$ActiveHistoryDtoFromJson(json);
  final int? id;
  final UserDto? user;
  final List<LocationDto>? locations;
  final List<ItemDto>? items;
  final String? status;
  @JsonKey(name: 'total_price')
  final String? totalPrice;
  @JsonKey(name: 'total_kg')
  final int? totalKg;
  final String? date;

  Map<String, dynamic> toJson() => _$ActiveHistoryDtoToJson(this);
}

@JsonSerializable()
class UserDto {

  const UserDto({
    required this.id,
    required this.name,
    required this.phoneNumber,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);
  final int? id;
  final String? name;
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}

@JsonSerializable()
class ItemDto {

  const ItemDto({
    required this.name,
    required this.price,
    required this.kg,
  });

  factory ItemDto.fromJson(Map<String, dynamic> json) => _$ItemDtoFromJson(json);
  final String? name;
  final String? price;
  final int? kg;

  Map<String, dynamic> toJson() => _$ItemDtoToJson(this);
}