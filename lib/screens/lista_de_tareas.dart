import 'package:eu/models/tasklist.dart';
import 'package:flutter/material.dart';

class ListaTareas extends StatefulWidget {
  const ListaTareas({
    super.key,
    required this.lista,
  });

  final ListaDeTareas lista;

  @override
  State<ListaTareas> createState() => _ListaTareasState();
}

class _ListaTareasState extends State<ListaTareas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.lista.nombre)),
    );
  }
}
