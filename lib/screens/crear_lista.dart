import 'package:eu/widgets/cartel_crear.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart' show showMaterialModalBottomSheet;

class CrearLista extends StatefulWidget {
  const CrearLista({super.key});

  @override
  State<CrearLista> createState() => _CrearListaState();
}

class _CrearListaState extends State<CrearLista> {
  @override
  Widget build(BuildContext context) {
    return CartelCrear(
      appBar: AppBar(
        title: Text("Crear lista"),
        primary: false,
      ),
      bottom: Padding(
        // espacio para que el boton de crear no toque el borde
        padding: EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text("Crear"),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12),
            child: TextFormField(
              // espacio para escribir el nombre de la lista
              decoration: const InputDecoration(
                labelText: 'Nombre de la lista',
                filled: true, // fondo con color
              ),
            ),
          ),
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
