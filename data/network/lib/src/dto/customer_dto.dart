import 'package:core/core.dart' hide Map;

part 'customer_dto.g.dart';

@JsonSerializable()
class CustomerDto {

  CustomerDto({
    required this.id,
    required this.name,
    required this.surname,
  });

  factory CustomerDto.fromJson(Map<String, dynamic> json){
    return _$CustomerDtoFromJson(json);
  }

  final int id;
  final String name;
  final String surname;

}