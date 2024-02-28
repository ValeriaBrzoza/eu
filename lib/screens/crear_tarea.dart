import 'package:eu/widgets/cartel_crear.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart' show showMaterialModalBottomSheet;

class CrearTarea extends StatefulWidget {
  const CrearTarea({super.key});

  @override
  State<CrearTarea> createState() => _CrearTareaState();
}

class _CrearTareaState extends State<CrearTarea> {
  String nombreTarea = '';
  //DateTime? fechaMaxima;

  //void seleccionarFechaMaxima(bool value) {
  //if (value) {
  //showDatePicker(
  //context: context,
  //initialDate: DateTime.now(),
  //firstDate: DateTime.now(),
  //lastDate: DateTime(2025), //ver si la lista tiene fecha maxima global
  //).then((fecha) {
  //if (fecha != null) {
  //setState(() {
  //fechaMaxima = fecha;
  //});
  //}
  //});
  //} else {
  //setState(() {
  //fechaMaxima = null;
  //});
  //}
  //}

  @override
  Widget build(BuildContext context) {
    return CartelCrear(
      appBar: AppBar(
        title: const Text("Crear tarea"),
        primary: false,
      ),
      bottom: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: nombreTarea == '' ? null : () {},
              child: const Text("Crear"),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(12),
              child: TextFormField(
                autofocus: true,
                autocorrect: false,
                onChanged: (value) => setState(() => nombreTarea = value),
                decoration: const InputDecoration(
                  labelText: "Nombre de la tarea",
                  filled: true,
                ),
              ))
        ],
      ),
    );
  }
}

//esta es la screen, todo lo de arriba era el widget que conforma la screen
void mostrarCrearTarea(BuildContext context) {
  showMaterialModalBottomSheet(
    // espacio vacio que sale de abajo
    context: context,
    builder: (context) {
      return const CrearTarea();
    },
  );
}
