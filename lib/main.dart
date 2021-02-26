import 'package:crud_firebase/src/pages/registro_page.dart';
import 'package:crud_firebase/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:flutter/material.dart';
import 'package:crud_firebase/src/blocs/provider.dart';
import 'package:crud_firebase/src/pages/home_page.dart';
import 'package:crud_firebase/src/pages/login_page.dart';
import 'package:crud_firebase/src/pages/producto_page.dart';
 
void main() async {
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  runApp(MyApp());
} 
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.deepPurple
        ),
        initialRoute: 'login',
        routes: {
          'login' : (BuildContext context) => LoginPage(),
          'home' : (BuildContext context) => HomePage(),
          'producto' : (BuildContext context) => ProductoPage(),
          'registro' : (BuildContext context) => RegistroPage(),
        },
      )
    );
  }
}