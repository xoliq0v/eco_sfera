enum AuthType {
  driver,
  partner,
  def
}

class AuthResult {
  final String? token;
  final AuthType? type;

  AuthResult({this.token, this.type});
}