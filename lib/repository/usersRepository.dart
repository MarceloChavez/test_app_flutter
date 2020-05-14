import 'package:http/http.dart' as http;
import 'dart:convert';

class UserRepository {
  final apiUrl = 'https://reqres.in/api'; // url de la API
  final apiUls = 'https://mercadito.fiuls.cl/negocios/search/'; // url de la uls

  final Map<String, String> headers = { // headers para el POST
    "Accept": "application/json",
    "Content-Type": "application/x-www-form-urlencoded"
  };

  constructor() {}

  // Esta función retornará un Future que usaremos en GetPage para obtener los usuarios 1 y 2
  Future<http.Response> getUser(int id) {
    return http.get('${apiUrl}/users/${id}');
  }

  Future<http.Response> getNegocios(Map<String, dynamic> body) {
    return http.post(apiUls, headers: headers, body: body);
  }
}
