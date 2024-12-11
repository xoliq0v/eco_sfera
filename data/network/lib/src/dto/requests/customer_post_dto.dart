import 'package:core/core.dart' hide Map;

part 'customer_post_dto.g.dart';

@JsonSerializable()
class CustomerPostDTO {
  CustomerPostDTO({
    required this.name,
    required this.surname,
    required this.middleName,
    required this.gender,
    required this.phone,
    required this.birthDate,
    required this.address,
  });

  final String name;
  final String surname;
  @JsonKey(name: 'middle_name')
  final String middleName;
  final String gender;
  final String phone;
  @JsonKey(name: 'birth_date')
  final String birthDate;
  final String address;


  factory CustomerPostDTO.fromJson(Map<String, dynamic> json) {
    return _$CustomerPostDTOFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CustomerPostDTOToJson(this);

}