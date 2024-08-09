import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import 'package:sansao_mobile/api/api_response.dart';
import 'package:sansao_mobile/utils/constants_util.dart';

import 'auth_request_model.dart';
import 'auth_response_model.dart';

class AuthService {
  static const String _apiHost = "localhost:8080";
  final _storage = const FlutterSecureStorage();

  Future<ApiResponse<bool>> validateUserToken() async {
    Uri url = Uri.http(_apiHost, "api/v1/auth/validate");
    var apiResponse = ApiResponse<bool>();
    try {
      var jwt = await _storage.read(key: ConstantUtils.jwt);
      if (jwt == null || jwt.isEmpty) {
        apiResponse.body = true;
        return apiResponse;
      }
      Response response = await http.get(url,
          headers: Map<String, String>.of(
              {HttpHeaders.authorizationHeader: 'Bearer $jwt'}));
      if (response.statusCode != 200) {
        apiResponse.hasError = true;
        apiResponse.error = response.body;
        log('Method: validateUserToken | Status code error: ${response.statusCode} | Timestamp: ${DateTime.timestamp().subtract(const Duration(hours: 3))}');
      }
    } on ClientException catch (e) {
      apiResponse.hasError = true;
      apiResponse.error = 'Client error.';
      log('Client error: $e');
    } catch (e) {
      apiResponse.hasError = true;
      apiResponse.error = e.toString();
      log('Unhandled error: $e');
    }
    return apiResponse;
  }

  Future<ApiResponse<AuthResponse>> authenticate(
      String username, String password) async {
    Uri url = Uri.http(_apiHost, "api/v1/auth");
    var apiResponse = ApiResponse<AuthResponse>();
    try {
      Response response = await http.post(url,
          headers: {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json"
          },
          body: json.encode(AuthRequest(username, password).toJson()));
      if (response.statusCode == 200) {
        var authResponse = AuthResponse.fromJson(json.decode(response.body));
        await _storage.write(key: ConstantUtils.jwt, value: authResponse.token);
      } else {
        apiResponse.hasError = true;
        apiResponse.error = response.body;
      }
    } on ClientException catch (e) {
      apiResponse.hasError = true;
      apiResponse.error = 'Servidor não encontrado.';
    } catch (e) {
      apiResponse.hasError = true;
      apiResponse.error = e.toString();
    }
    return apiResponse;
  }
}
