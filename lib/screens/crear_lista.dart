import 'package:eu/models/tasklist.dart';
import 'package:eu/screens/lista_de_tareas.dart';
import 'package:eu/services/data_provider.dart';
import 'package:eu/widgets/cartel_crear.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart' show showMaterialModalBottomSheet;

class CrearLista extends StatefulWidget {
  const CrearLista({super.key});

  @override
  State<CrearLista> createState() => _CrearListaState();
}

class _CrearListaState extends State<CrearLista> {
  String nombreLista = "";
  bool requerirFechaMaxima = false;
  DateTime? fechaMaximaGlobal;

  void seleccionarFechaMaximaGlobal(bool value) {
    if (value) {
      showDatePicker(
        //muestra el dialog con el calendario o para poner fecha
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365 * 100)), //fecha maxima que se puede poner
      ).then((value) {
        if (value != null) {
          setState(() => fechaMaximaGlobal = value); //si se selecciono algo, se guarda en la variable
        }
      });
    } else {
      setState(() => fechaMaximaGlobal = null); //si no se selecciono nada
    }
  }

  @override
  Widget build(BuildContext context) {
    //constructor del widget
    return CartelCrear(
      appBar: AppBar(
        title: const Text("Crear lista"),
        primary: false,
      ),
      bottom: Padding(
        // espacio para que el boton de crear no toque el borde
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: nombreLista == "" ? null : crearLista, //la lista debe tener nombre para poder crearse
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
              onChanged: (value) =>
                  setState(() => nombreLista = value), //cambia el nombre de la lista y reconstruye la vista
              decoration: const InputDecoration(
                labelText: 'Nombre de la lista',
                filled: true, // fondo con color
              ),
            ),
          ),
          //switch para requerir fecha maxima para cada tarea
          SwitchListTile(
            value: requerirFechaMaxima,
            onChanged: (value) => setState(
                () => requerirFechaMaxima = value), //cambia el valor de requerir fecha maxima y reconstruye la vista
            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
            title: const Text("Las tareas deben tener fecha máxima"),
          ),
          //switch para requerir fecha maxima global
          SwitchListTile(
            value: fechaMaximaGlobal != null,
            onChanged: seleccionarFechaMaximaGlobal,
            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
            title: const Text("Fecha máxima global"),
            subtitle: fechaMaximaGlobal == null
                ? null
                : Text(
                    "${fechaMaximaGlobal!.day}/${fechaMaximaGlobal!.month}/${fechaMaximaGlobal!.year}",
                  ),
          ),
        ],
      ),
    );
  }

  void crearLista() {
    //lo que pasa cuando le das al boton de crear, crea la lista
    final lista = ListaDeTareas(
      nombre: nombreLista,
      tareasConFechaLimite: requerirFechaMaxima,
      fechaLimite: fechaMaximaGlobal,
      idsDeUsuarios: [FirebaseAuth.instance.currentUser!.uid],
    );

    DataProvider.instance.crearLista(lista);

    if (context.mounted) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => VistaListaTareas(lista: lista)));
    }
  }
}

//esta es la screen, todo lo de arriba era el widget que conforma la screen
void mostrarCrearLista(BuildContext context) {
  showMaterialModalBottomSheet(
    // espacio vacío que sale de abajo
    context: context,
    builder: (context) {
      return const CrearLista();
    },
  );
}
