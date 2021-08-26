import 'package:firebaseconecta/models/carrera.dart';
import 'package:firebaseconecta/models/usuario.dart';
import 'package:firebaseconecta/widgets/loading.dart';
import 'package:firebaseconecta/widgets/muestra_error.dart';
import 'package:flutter/material.dart';
import 'package:firebaseconecta/models/db.dart' as db;

class UsuarioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Usuario usuario =
        ModalRoute.of(context)!.settings.arguments as Usuario;
    return Scaffold(
      appBar: AppBar(
        title: Text(usuario.nombre),
      ),
      body: StreamBuilder(
        stream: db.getUsuarioCarreras(usuario.id),
        builder: (context, AsyncSnapshot<List<Carrera>> snapshot) {
          if (snapshot.hasError) {
            return MuestraError(snapshot.error.toString());
          }
          if (!snapshot.hasData) {
            return Loading();
          }

          List<Carrera> carreras = snapshot.data!;
          return ListView.builder(
            itemCount: carreras.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(carreras[index].conductor),
                subtitle: Text(carreras[index].fechahora.toString()),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          db.guardaCarrera('sYltNv3wGSThk65ONG3f', new Carrera('Danteeeeee'));
        },
        child: const Icon(Icons.navigation),
        backgroundColor: Colors.green,
      ),
    );
  }
}
