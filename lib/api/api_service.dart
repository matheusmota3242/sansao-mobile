import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer'; //(auto import will do this even)

import 'package:http/http.dart';
import 'package:sansao_mobile/api/api_response.dart';
import 'package:sansao_mobile/auth/auth_request_model.dart';
import 'package:sansao_mobile/auth/auth_response_model.dart';
import 'package:sansao_mobile/training/model/training_detail_model.dart';
import 'package:sansao_mobile/training/model/training_reference_model.dart';

class ApiService {
  //static const String _apiHost = "192.168.15.188:8080";
  static const String _apiHost = "localhost:8080";
  final _storage = const FlutterSecureStorage();

  static Future<ApiResponse<List<TrainingReference>>>
      getTrainingReferences() async {
    Uri url = Uri.http(_apiHost, "api/training/reference");
    var apiResponse = ApiResponse<List<TrainingReference>>();
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        apiResponse.body = (json.decode(response.body) as List)
            .map((e) => TrainingReference.fromJson(e))
            .toList();
      } else {
        apiResponse.hasError = true;
        apiResponse.error = response.body;
        log('Method: validateUserToken | Status code error: ${response.statusCode} | Timestamp: ${DateTime.timestamp().subtract(const Duration(hours: 3))}');
      }
    } on ClientException catch (e) {
      apiResponse.hasError = true;
      apiResponse.error = 'Servidor não encontrado.';
      log('Client error: $e');
    }
    return apiResponse;
  }

  static Future<ApiResponse<TrainingDetail>> getTrainingById(int id) async {
    Uri url = Uri.http(_apiHost, "api/training/$id");
    var apiResponse = ApiResponse<TrainingDetail>();
    try {
      Response response = await http.get(url);
      if (response.statusCode == 200) {
        apiResponse.body = TrainingDetail.fromJson(json.decode(response.body));
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
