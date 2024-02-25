import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eu/models/tasklist.dart';

class DataProvider {
  Future<ListaDeTareas> crearLista(ListaDeTareas lista) async {
    final referencia = await FirebaseFirestore.instance.collection('tasklists').add(lista.toJson());

    return ListaDeTareas.fromJson(lista.toJson(), referencia.id);
  }

  static DataProvider get instance {
    return DataProvider();
  }
}
