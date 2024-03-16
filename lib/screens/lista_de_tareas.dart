import 'package:eu/models/tasklist.dart';
import 'package:flutter/material.dart';
import 'package:eu/widgets/boton_crear_tarea.dart';

class VistaListaTareas extends StatefulWidget {
  const VistaListaTareas({
    super.key,
    required this.lista,
  });

  final ListaDeTareas lista;

  @override
  State<VistaListaTareas> createState() => _VistaListaTareasState();
}

class _VistaListaTareasState extends State<VistaListaTareas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.lista.nombre),
      ), // widget es la instancia de ListaTareas y el lista es la lista de la instancia
      floatingActionButton: BotonCrearTarea(
        lista: widget.lista,
      ),
    );
  }
}
