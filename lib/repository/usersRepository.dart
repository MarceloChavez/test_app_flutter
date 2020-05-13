import 'package:http/http.dart' as http;

class UserRepository {
  final apiUrl = 'https://reqres.in/api'; // url de la API

  constructor(){}

  // Esta función retornará un Future para usarlo en la UI
  Future<http.Response> getUser(int id){
    return http.get('${apiUrl}/users/${id}');
  }
}