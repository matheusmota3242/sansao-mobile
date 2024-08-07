class AuthRequest {
  late String username;
  late String password;

  AuthRequest(this.username, this.password);

  toJson() => {'username': username, 'password': password};
}
