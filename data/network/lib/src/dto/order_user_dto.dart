import 'package:core/core.dart';

part 'order_user_dto.g.dart';

@JsonSerializable()
class OrderUserDto {
  OrderUserDto({
    required this.id,
    required this.name,
    required this.phoneNumber,
  });

  factory OrderUserDto.fromJson(Map<String, dynamic> json){
    return _$OrderUserDtoFromJson(json);
  }

  final int id;
  final String? name;
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;

}