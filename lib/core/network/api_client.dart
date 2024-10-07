import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {
  final String? baseUrl;

  ApiClient([this.baseUrl]);

  Future<Map<String, dynamic>> get(
      {String? customBaseUrl,
      required String endpoint,
      Map<String, String>? headers}) async {
    final response = await http.get(
      Uri.parse('${customBaseUrl ?? baseUrl}$endpoint'),
      headers: headers ?? {'Content-Type': 'application/json'},
    );
    return _processResponse(response);
  }

  Future<Map<String, dynamic>> post(
      {String? customBaseUrl,
      required String endpoint,
      Map<String, String>? headers,
      dynamic body}) async {
    final response = await http.post(
      Uri.parse('${customBaseUrl ?? baseUrl}$endpoint'),
      headers: headers ?? {'Content-Type': 'application/json'},
      body: json.encode(body),
    );
    return _processResponse(response);
  }

  Future<Map<String, dynamic>> put(
      {String? customBaseUrl,
      required String endpoint,
      Map<String, String>? headers,
      dynamic body}) async {
    final response = await http.put(
      Uri.parse('${customBaseUrl ?? baseUrl}$endpoint'),
      headers: headers ?? {'Content-Type': 'application/json'},
      body: json.encode(body),
    );
    return _processResponse(response);
  }

  Future<Map<String, dynamic>> delete(
      {String? customBaseUrl,
      required String endpoint,
      Map<String, String>? headers}) async {
    final response = await http.delete(
        Uri.parse('${customBaseUrl ?? baseUrl}$endpoint'),
        headers: headers);
    return _processResponse(response);
  }

  Future<Map<String, dynamic>> _processResponse(http.Response response) async {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return json.decode(response.body);
    } else {
      throw Exception('Error: ${response.statusCode} - ${response.body}');
    }
  }
}
