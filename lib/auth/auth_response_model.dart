class AuthResponse {
  late String token;

  AuthResponse.fromJson(Map<String, dynamic> json) : token = json['token'];
}
