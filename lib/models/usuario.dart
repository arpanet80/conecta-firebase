import 'package:cloud_firestore/cloud_firestore.dart';

class Usuario {
  late String id;
  late String nombre;
  late int edad;
  late bool activo;
  late String imagen;

  Usuario.fromFirestore(DocumentSnapshot doc)
      : id = doc.id, //doc.documentID,
        nombre = doc['nombre'],
        edad = doc['edad'],
        activo = doc['activo'],
        imagen = doc['imagen'];
}

List<Usuario> toUsuarioList(QuerySnapshot query) {
  return query.docs.map((doc) => Usuario.fromFirestore(doc)).toList();
}
