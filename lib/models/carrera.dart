import 'package:cloud_firestore/cloud_firestore.dart';

class Carrera {
  late String id;
  late DateTime fechahora;
  late String direccion;
  late String importe;
  late String conductor;

  Carrera.fromFirestore(DocumentSnapshot doc)
      : id = doc.id,
        fechahora = (doc['fecha'] as Timestamp).toDate(),
        direccion = doc['direccion'].toString(),
        importe = doc['importe'].toString(),
        conductor = doc['conductor'];

  Map<String, dynamic> toFirestore() => {
        'fecha': fechahora,
        'direccion': direccion,
        'importe': importe,
        'conductor': conductor
      };

  Carrera(String conductor) {
    this.fechahora = DateTime.now();
    //this.direccion = direccion;
    //this.importe = importe;
    this.conductor = conductor;
  }
}

List<Carrera> toCarreraList(QuerySnapshot query) {
  return query.docs.map((doc) => Carrera.fromFirestore(doc)).toList();
}
