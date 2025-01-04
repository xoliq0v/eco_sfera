import 'package:core/core.dart' hide Map;

part 'auth_res_dto.g.dart';

@JsonSerializable()
class AuthResDTO {
  AuthResDTO({
    required this.token,
    required this.type,
  });

  factory AuthResDTO.fromJson(Map<String, dynamic> json) {
    return _$AuthResDTOFromJson(json);
  }


  Map<String, dynamic> toJson() {
    return _$AuthResDTOToJson(this);
  }

  final String token;
  final String type;
}
