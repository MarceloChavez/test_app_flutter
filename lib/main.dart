import 'package:flutter/material.dart';
import 'package:test_app/pages/getPage.dart';
import 'package:test_app/pages/homePage.dart';
import 'package:test_app/pages/postPage.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test_App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomePage(),
        'get-page': (BuildContext context) =>  GetPage(),
        'post-page': (BuildContext  context) => PostPage()
      },      
    );
  }
}