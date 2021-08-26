import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseconecta/models/carrera.dart';
import 'package:firebaseconecta/models/usuario.dart';

Stream<List<Usuario>> getUsuarios() {
  return FirebaseFirestore.instance
      .collection('usuarios')
      .snapshots()
      .map(toUsuarioList);
}

Stream<List<Carrera>> getUsuarioCarreras(String usuarioID) {
  //return FirebaseFirestore.instance.collection('usuarios').doc(usuarioID).collection('carreras').snapshots().map(toCarreraList);
  return FirebaseFirestore.instance
      .collection('usuarios/$usuarioID/carreras')
      .snapshots()
      .map(toCarreraList);
}

Future<void> guardaCarrera(String usuarioID, Carrera carrera) async {
  await FirebaseFirestore.instance
      .collection('usuarios/$usuarioID/carreras')
      .add(carrera.toFirestore());
}
