import 'package:firebaseconecta/models/db.dart' as db;
import 'package:firebaseconecta/models/usuario.dart';
import 'package:firebaseconecta/widgets/loading.dart';
import 'package:firebaseconecta/widgets/muestra_error.dart';
import 'package:firebaseconecta/widgets/usuario_card.dart';
import 'package:flutter/material.dart';

class FirePage extends StatefulWidget {
  FirePage({Key? key}) : super(key: key);

  @override
  _FirePageState createState() => _FirePageState();
}

class _FirePageState extends State<FirePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: db.getUsuarios(),
          builder: (context, AsyncSnapshot<List<Usuario>> snapshot) {
            if (snapshot.hasError) {
              return MuestraError(snapshot.error.toString());
            }

            if (!snapshot.hasData) {
              return Loading();
            }

            List<Usuario> usuarios = snapshot.data!;
            return ListView.builder(
              itemCount: usuarios.length,
              itemBuilder: (context, index) {
                return UsuarioCard(usuarios[index]);
              },
            );
          }),
    );
  }
}
