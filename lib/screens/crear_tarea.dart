import 'package:eu/models/tasklist.dart';
import 'package:eu/widgets/cartel_crear.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart' show showMaterialModalBottomSheet;

class CrearTarea extends StatefulWidget {
  const CrearTarea({super.key, required this.lista});
  final ListaDeTareas lista;

  @override
  State<CrearTarea> createState() => _CrearTareaState();
}

class _CrearTareaState extends State<CrearTarea> {
  String nombreTarea = '';
  DateTime? fechaLimite;

  bool habilitarCrearTarea() {
    if (nombreTarea.isEmpty) {
      return false;
    }
    if (widget.lista.tareasConFechaLimite && fechaLimite == null) {
      return false;
    }
    return true;
  }

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
              onPressed: !habilitarCrearTarea() ? null : () {},
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
            ),
          ),
          if (widget.lista.tareasConFechaLimite)
            ListTile(
              title: const Text("Fecha límite"),
              subtitle: fechaLimite == null
                  ? null
                  : Text(
                      "${fechaLimite!.day}/${fechaLimite!.month}/${fechaLimite!.year}",
                    ),
              trailing: const Icon(Icons.calendar_today_rounded),
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: widget.lista.fechaLimite ?? DateTime.now().add(const Duration(days: 365 * 100)),
                ).then((value) {
                  if (value != null) {
                    setState(() => fechaLimite = value);
                  }
                });
              },
            ),
        ],
      ),
    );
  }
}

//esta es la screen, todo lo de arriba era el widget que conforma la screen
void mostrarCrearTarea(BuildContext context, ListaDeTareas lista) {
  showMaterialModalBottomSheet(
    // espacio vacío que sale de abajo
    context: context,
    builder: (context) {
      return CrearTarea(lista: lista);
    },
  );
}
