import 'package:eu/widgets/cartel_crear.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart' show showMaterialModalBottomSheet;

class CrearLista extends StatefulWidget {
  const CrearLista({super.key});

  @override
  State<CrearLista> createState() => _CrearListaState();
}

class _CrearListaState extends State<CrearLista> {
  void crearLista() {}

  String nombreLista = "";
  bool requerirFechaMaxima = false;
  DateTime? fechaMaximaGlobal;

  void seleccionarFechaMaximaGlobal(bool value) {
    if (value) {
      showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2100),
      ).then((value) {
        if (value != null) {
          setState(() => fechaMaximaGlobal = value);
        }
      });
    } else {
      setState(() => fechaMaximaGlobal = null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CartelCrear(
      appBar: AppBar(
        title: Text("Crear lista"),
        primary: false,
      ),
      bottom: Padding(
        // espacio para que el boton de crear no toque el borde
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: nombreLista == "" ? null : crearLista,
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
              // espacio para escribir el nombre de la lista
              autofocus: true,
              autocorrect: false,
              onChanged: (value) => setState(() => nombreLista = value),
              decoration: const InputDecoration(
                labelText: 'Nombre de la lista',
                filled: true, // fondo con color
              ),
            ),
          ),
          //switch para requerir fecha maxima para cada tarea
          SwitchListTile(
            value: requerirFechaMaxima,
            onChanged: (value) => setState(() => requerirFechaMaxima = value),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
            title: const Text("Las tareas deben tener fecha máxima"),
          ),
          //switch para requerir fecha maxima global
          SwitchListTile(
              value: fechaMaximaGlobal != null,
              onChanged: seleccionarFechaMaximaGlobal,
              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              title: Text("Fecha máxima global"),
              subtitle: fechaMaximaGlobal == null
                  ? null
                  : Text(
                      "${fechaMaximaGlobal!.day}/${fechaMaximaGlobal!.month}/${fechaMaximaGlobal!.year}",
                    )),
        ],
      ),
    );
  }
}

void mostrarCrearLista(BuildContext context) {
  showMaterialModalBottomSheet(
    // espacio vacio que sale de abajo
    context: context,
    builder: (context) {
      return CrearLista();
    },
  );
}
