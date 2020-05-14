import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:test_app/models/User.dart';
import 'package:test_app/repository/usersRepository.dart';

class GetPage extends StatefulWidget {
  GetPage({Key key}) : super(key: key);

  @override
  _GetPageState createState() => _GetPageState();
}

class _GetPageState extends State<GetPage> {
  final UserRepository userRepository =
      new UserRepository(); // importamos la clase UserRepository para usar sus métodos mas adelante
  int userOption; // sera posteriormente el id que le mandaremos al api para buscar el user

  @override
  void initState() {
    // con el initState podemos trabajar posteriormente con setState() para que se vuelva a construir el widget completo si hay cambios
    super.initState();
    int userOption; // debemos declarar la var que gatille un re build del widget
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Get Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (userOption != null) getwidget(userOption), // function que retorna el widget que muestra la data obtenida del API
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text('GET USER 1'),
                  onPressed: () {
                    setState(() {
                      // si apretamos este boton cambiamos el valor de userOption y se hace el rebuild del widget
                      userOption = 1;
                    });
                  },
                ),
                SizedBox(width: 10),
                RaisedButton(
                  child: Text('GET USER 2'),
                  onPressed: () {
                    setState(() {
                      // lo mismo que el otro botón pero con otro valor
                      userOption = 2;
                    });
                  },
                ),
                SizedBox(width: 10),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget getwidget(int id) {
    return FutureBuilder(
      // FutureBuilder nos sirve para renderizar un widget en base a un Future (es lo mismo que una Promise en JS)
      future: userRepository.getUser(id), // acá debes poner el Future que se debe cumplir, en este caso lo tenemos en la clase UserRepository
      builder: (BuildContext context, AsyncSnapshot<Response> snapshot) {// el builder es la función que nos permite recibir la data del Future para poder usarla
        if (snapshot.hasData) { // esto valida si la respuesta tiene algun dato
          var jsonResponseBody = json.decode(snapshot.data.body); // parseamos el body de la respuesta, para obtener la data en un json
          UserModel user = UserModel.fromJson(jsonResponseBody); // le pasamos el json al constructor de nuestra clase UserModel para que cree el objeto
          return ListTile(// widget que se mostrará si hay data
            leading: Image(
              image: NetworkImage(user.avatar), // muesta la img de perfil del user
            ),
            title: Text('${user.name} ${user.lastName}'), // muestra el nombre y apellido del user
          );
        }
        return CircularProgressIndicator(); // en el caso de que aun no haya data o nunca la haya, se muesta este loading
      },
    );
  }
}
