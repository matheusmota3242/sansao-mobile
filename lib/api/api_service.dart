import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:http/http.dart';
import 'package:sansao_mobile/api/api_response.dart';
import 'package:sansao_mobile/training/model/training_reference_model.dart';

class ApiService {
  static const String apiHost = "192.168.15.188:8080";

  static Future<ApiResponse<List<TrainingReference>>>
      getTrainingReferences() async {
    Uri url = Uri.http(apiHost, "api/training/reference");
    ApiResponse<List<TrainingReference>> apiResponse =
        ApiResponse<List<TrainingReference>>();
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        apiResponse.body = (json.decode(response.body) as List)
            .map((e) => TrainingReference.fromJson(e))
            .toList();
      } else {
        apiResponse.hasError = true;
        apiResponse.error = response.body;
      }
    } catch (error) {
      apiResponse.hasError = true;
      // Em caso de exceção, mostra o erro
      print('Erro na requisição: $error');
    }
    return apiResponse;
  }

  static Future<dynamic> getTrainingById(int id) async {
    Uri url = Uri.http(apiHost, "api/training/$id");
    try {
      Response response = await http.get(url);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      }
    } catch (e) {
      print('Erro na requisição: $e');
    }
  }
}
