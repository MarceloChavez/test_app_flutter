class Negocio {
  int id;
  String nombre;
  String direccion;
  double latitud;
  double longitud;

  Negocio.fromJson(Map<String, dynamic> json){
    id  = json['id'];
    nombre  = json['nombre'];
    direccion  = json['direccion'];
    latitud  = json['latitud'];
    longitud  = json['longitud'];
  }
}