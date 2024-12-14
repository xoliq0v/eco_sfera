import 'package:core/core.dart';

class AuthModel extends Equatable {
  AuthModel({
    required this.login,
    required this.password,
    required this.deviceToken,
  });

  final String login;
  final String password;
  final String deviceToken;

  @override
  List<Object?> get props => [
    login,
    password,
    deviceToken,
  ];



}