import 'package:core/core.dart' hide Map;

part 'auth_dto.g.dart';

@JsonSerializable()
class AuthDTO {
  AuthDTO({
    required this.login,
    required this.password,
    required this.deviceToken,
  });

  factory AuthDTO.fromJson(Map<String, dynamic> json) {
    return _$AuthDTOFromJson(json);
  }

  final String login;
  final String password;
  @JsonKey(name: 'device_token')
  final String deviceToken;
}
