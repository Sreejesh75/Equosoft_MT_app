import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {
  static const String _baseUrl = "https://api.escuelajs.co/api/v1";

  static Future<dynamic> get(String endpoint) async {
    final url = Uri.parse("$_baseUrl$endpoint");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load data (${response.statusCode})");
    }
  }
}
