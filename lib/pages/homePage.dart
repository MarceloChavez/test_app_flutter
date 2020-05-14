import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Ir a ejemplo GET'),
              onPressed: (){
                Navigator.pushNamed(context, 'get-page');
              },
            ),
            RaisedButton(
              child: Text('Ir a ejemplo POST'),
              onPressed: (){
                Navigator.pushNamed(context, 'post-page');
              },
            ),
          ],
        ),
      ),
    );
  }
}
