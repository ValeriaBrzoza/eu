import 'package:eu/models/tasklist.dart';
import 'package:flutter/material.dart';
import 'package:eu/screens/crear_tarea.dart';

class BotonCrearTarea extends StatelessWidget {
  const BotonCrearTarea({super.key, required this.lista});

  final ListaDeTareas lista;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => mostrarCrearTarea(context, lista),
      child: const Icon(Icons.add_rounded),
    );
  }
}
