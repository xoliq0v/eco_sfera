// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_history_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActiveHistoryDto _$ActiveHistoryDtoFromJson(Map<String, dynamic> json) =>
    ActiveHistoryDto(
      id: (json['id'] as num).toInt(),
      user: UserDto.fromJson(json['user'] as Map<String, dynamic>),
      locations: (json['locations'] as List<dynamic>)
          .map((e) => LocationDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      items: (json['items'] as List<dynamic>)
          .map((e) => ItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String,
      totalPrice: json['total_price'] as String,
      totalKg: (json['total_kg'] as num).toInt(),
      date: json['date'] as String?,
    );

Map<String, dynamic> _$ActiveHistoryDtoToJson(ActiveHistoryDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'locations': instance.locations,
      'items': instance.items,
      'status': instance.status,
      'total_price': instance.totalPrice,
      'total_kg': instance.totalKg,
      'date': instance.date,
    };

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      phoneNumber: json['phone_number'] as String,
    );

Map<String, dynamic> _$UserDtoToJson(UserDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone_number': instance.phoneNumber,
    };

ItemDto _$ItemDtoFromJson(Map<String, dynamic> json) => ItemDto(
      name: json['name'] as String,
      price: json['price'] as String,
      kg: (json['kg'] as num).toInt(),
    );

Map<String, dynamic> _$ItemDtoToJson(ItemDto instance) => <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
      'kg': instance.kg,
    };
