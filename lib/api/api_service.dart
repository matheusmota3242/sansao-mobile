import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String apiHost = "192.168.0.113:8080";

  static Future<dynamic> getTrainings() async {
    Uri url = Uri.http(apiHost, "api/training");

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      }
      print('Status code erro: ${response.statusCode}');
    } catch (error) {
      // Em caso de exceção, mostra o erro
      print('Erro na requisição: $error');
    }
  }
}
