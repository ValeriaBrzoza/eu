import 'package:eu/screens/crear_lista.dart';
import 'package:flutter/material.dart';

class BotonCrear extends StatelessWidget {
  const BotonCrear({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => mostrarCrearLista(context),
      child: const Icon(Icons.add_rounded),
    );
  }
}
