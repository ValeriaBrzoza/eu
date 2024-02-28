import 'package:flutter/material.dart';
import 'package:eu/screens/crear_tarea.dart';

class BotonCrearTarea extends StatelessWidget {
  const BotonCrearTarea({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => mostrarCrearTarea(context),
      child: const Icon(Icons.add_rounded),
    );
  }
}
