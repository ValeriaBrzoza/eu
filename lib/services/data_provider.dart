import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eu/models/tasklist.dart';

class DataProvider {
  Future<TaskList> crearLista(TaskList lista) async {
    final referencia = await FirebaseFirestore.instance.collection('tasklists').add(lista.toJson());

    return TaskList.fromJson(lista.toJson(), referencia.id);
  }

  static DataProvider get instance {
    return DataProvider();
  }
}
