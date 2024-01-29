import 'package:eu/widgets/boton_crear.dart';
import 'package:flutter/material.dart';

class PantallaListasDeTareas extends StatelessWidget {
  const PantallaListasDeTareas({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ListasAppBar(),
      floatingActionButton: BotonCrear(),
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
