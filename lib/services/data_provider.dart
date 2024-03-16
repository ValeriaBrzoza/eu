import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eu/models/tasklist.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DataProvider {
  Future<ListaDeTareas> crearLista(ListaDeTareas lista) async {
    final referencia = await FirebaseFirestore.instance.collection('tasklists').add(lista.toJson());

    return ListaDeTareas.fromJson(lista.toJson(), referencia.id);
  }

  Stream<List<ListaDeTareas>> obtenerListas() async* {
    // final listaDeTareas = FirebaseFirestore.instance.collection('tasklists').snapshots().map((snapshot) {
    //   return snapshot.docs.map((doc) => ListaDeTareas.fromJson(doc.data(), doc.id)).toList();
    // });

    final referenciaColeccion = FirebaseFirestore.instance.collection('tasklists');
    // .where('user', isEqualTo: FirebaseAuth.instance.currentUser!.uid);

    // Creo un stream en base a la colección de tasklists
    final stream = referenciaColeccion.snapshots();

    await for (final snapshot in stream) {
      // for infinito asíncrono, se ejecuta por cada cosa que vaya apareciendo en el stream

      final listas = <ListaDeTareas>[];

      for (final doc in snapshot.docs) {
        //.docs son los datos posta
        final lista = ListaDeTareas.fromJson(doc.data(), doc.id);
        listas.add(lista);
      }

      yield listas; // te escupe el resultado siempre que se ejecuta el for
    }
  }

  static DataProvider get instance {
    return DataProvider();
  }
}
