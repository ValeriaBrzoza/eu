import 'package:eu/models/tasklist.dart';
import 'package:eu/screens/lista_de_tareas.dart';
import 'package:eu/services/data_provider.dart';
import 'package:eu/widgets/boton_crear.dart';
import 'package:flutter/material.dart';

class PantallaListasDeTareas extends StatefulWidget {
  const PantallaListasDeTareas({super.key});

  @override
  State<PantallaListasDeTareas> createState() => _PantallaListasDeTareasState();
}

class _PantallaListasDeTareasState extends State<PantallaListasDeTareas> {
  Stream<List<ListaDeTareas>> listasDeTareas = DataProvider.instance.obtenerListas();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ListasAppBar(),
      floatingActionButton: const BotonCrear(),
      body: ListasDeTareas(
        listasDeTareas: listasDeTareas,
      ),
    );
  }
}

//la barra de arriba de la pantalla de listas de tareas
class ListasAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ListasAppBar({super.key});

  void _search() {}

  void _sort() {}

  void _settings() {}

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Listas de tareas'),
      actions: [
        IconButton(
          icon: const Icon(Icons.search_rounded),
          onPressed: _search,
        ),
        IconButton(
          icon: const Icon(Icons.sort_rounded),
          onPressed: _sort,
        ),
        IconButton(
          icon: const Icon(Icons.settings_rounded),
          onPressed: _settings,
        )
      ],
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}

class ListasDeTareas extends StatelessWidget {
  const ListasDeTareas({super.key, required this.listasDeTareas});

  final Stream<List<ListaDeTareas>> listasDeTareas;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: listasDeTareas,
      builder: (context, snapshot) {
        // Se ejecuta cada vez que cambia el stream (lista de tareas)
        if (snapshot.error != null) {
          // Si hay un error
          return const Center(
            child: Text("Error al obtener las listas"),
          );
        }

        // Lo pudimos leer, YAY!
        if (!snapshot.hasData) {
          // No tiene datos
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final listas = snapshot.data!; // Tiene datos, YAY!

        if (listas.isEmpty) {
          // El dato me confirma que no hay listas
          return const Center(child: Text("No hay listas"));
        }

        // Hay datos y hay listas!
        return ListView(
          // ListView es la vista entera
          children: listas
              .map(
                (list) => ListTile(
                  // Cada Lista de tareas es un ListTile
                  title: Text(list.nombre),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => VistaListaTareas(lista: list)));
                  },
                ),
              )
              .toList(),
        );
      },
    );
  }
}
