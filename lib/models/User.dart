class UserModel {
  int id;
  String name;
  String lastName;
  String avatar;

  UserModel.fromJson(Map<String, dynamic> json){ // constructor para crear objeto recibiendo como parámetro un json
    var jsonData = json['data'];
    id = jsonData['id'];
    name = jsonData['first_name'];
    lastName = jsonData['last_name'];
    avatar = jsonData['avatar'];
  }
}