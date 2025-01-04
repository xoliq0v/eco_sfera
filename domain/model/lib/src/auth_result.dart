enum AuthType {
  driver,
  partner,
}

class AuthResult {
  final String? token;
  final AuthType? type;

  AuthResult({this.token, this.type});
}