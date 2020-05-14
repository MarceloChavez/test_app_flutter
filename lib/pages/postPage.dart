import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test_app/models/negocio.dart';
import 'package:test_app/repository/usersRepository.dart';

class PostPage extends StatefulWidget {
  PostPage({Key key}) : super(key: key);

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final UserRepository userRepository = new UserRepository();
  bool showResponse = false;

  @override
  void initState() {
    super.initState();
    bool showResponse;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Post Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (showResponse) responseWidget(), // una vez que presionemos el boton POST se mostrará el widget
            RaisedButton(
              child: Text('POST'),
              onPressed: () {
                setState(() { // cambia el valor de showResponse para que se muestre el widget responseWidget()
                  showResponse = true;
                });
              },
            )
          ],
        ),
      ),
    );
  }

  Widget responseWidget() {
    Map<String, dynamic> bodyPost = { // valores harcodeados
      'distancia': '25',
      'search': 'Pescadería Puertas del Mar',
      'categoria': 'ALL',
      'lat': '-29.887052399999998',
      'lon': '-71.2755305',
      'metodo_pago': 'Dinero en Efectivo'
    };

    return FutureBuilder( // widget que se mostrará cuando presiones el botón POST
      future: userRepository.getNegocios(bodyPost), // Future que retorna los negocios
      builder: (BuildContext context, AsyncSnapshot snapshot) { // Función para construir la vista
        if (snapshot.hasData) { // validación si viene data 
          List<dynamic> responseBody = json.decode(snapshot.data.body); // parseamos la respuesta recibida a json
          // en este ejemplo solo mostraremos el primer resultado responseBody[0]
          Negocio negocio = Negocio.fromJson(responseBody[0]); // usamos el modelo creado para Negocio y creamos un nuevo objeto Negocio
          return Container( // container que mostrará la respuesta
            height: 400,
            width: 400,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Text('id: ${negocio.id}'),
                  Text('nombre: ${negocio.nombre}'),
                  Text('latitud: ${negocio.latitud}'),
                  Text('longitud: ${negocio.longitud}'),

                ],
              ),
            ), // muestra en texto la respuesta completa
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
