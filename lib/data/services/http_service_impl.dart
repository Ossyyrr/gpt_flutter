import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:open_ia_gpt_flutter/core/services/http_service_interface.dart';

class HttpServiceImpl implements HttpServiceInterface {
  final headers = {
    'Content-Type': 'application/json',
    'Authorization':
        'Bearer sk-XXMLYY64YgM3leC5CunGT3BlbkFJFqF36Bn59iyBFjlJI9nEx', // API KEY https://platform.openai.com/api-keys
  };

  @override
  Future<dynamic> get(String url) async {
    final response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    return _handleResponse(response);
  }

  @override
  Future<dynamic> post(String url, body) async {
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: json.encode(body),
    );
    return _handleResponse(response);
  }

  @override
  Future<dynamic> update(String url, dynamic data) async {
    final response = await http.put(
      Uri.parse(url),
      headers: headers,
      body: json.encode(data),
    );
    return _handleResponse(response);
  }

  @override
  Future<dynamic> delete(String url) async {
    final response = await http.delete(
      Uri.parse(url),
      headers: headers,
    );
    return _handleResponse(response);
  }

  dynamic _handleResponse(http.Response response) {
    final responseBody = json.decode(response.body);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return responseBody;
    } else {
      throw Exception(
          'Error en la solicitud: ${response.statusCode} - ${responseBody['message']}');
    }
  }
}
