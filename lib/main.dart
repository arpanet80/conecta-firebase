import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseconecta/pages/fire_page.dart';
//import 'package:firebaseconecta/pages/mapas_google.dart';
import 'package:firebaseconecta/pages/usuario_page.dart';
//import 'package:firebaseconecta/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/*void main() {
  runApp(MyApp());
}*/

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conecta Firestore',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        brightness: Brightness.dark,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => FirePage(), //MapasGoogle(), //FirePage(),
        '/datosUsuario': (_) => UsuarioPage(),
      },
      //home: HomePage(),
      //home: FirePage(),
    );
  }
}
