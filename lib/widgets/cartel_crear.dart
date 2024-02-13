import 'package:flutter/material.dart';

class CartelCrear extends StatelessWidget {
  // widget generico para lo que va dentro del espacio vacio que sale de abajo
  const CartelCrear({
    super.key,
    this.appBar,
    required this.body,
    this.bottom,
    this.bottomHeight = 56.0,
    this.appBarHeight = 56.0,
  });

  final Widget? appBar;
  final double appBarHeight;
  final Widget body;
  final Widget? bottom;
  final double bottomHeight;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    final statusbarHeight = MediaQuery.of(context).padding.top;

    final heightConstraint = height - statusbarHeight;

    final keyBoardSize = MediaQuery.of(context).viewInsets.bottom;

    double contentHeight = heightConstraint - keyBoardSize; // contenido scrolleable

    if (appBar != null) {
      contentHeight -= appBarHeight;
    }

    if (bottom != null) {
      contentHeight -= bottomHeight;
    }

    return Container(
      // limita la altura del espacio vacio que sale de abajo
      constraints: BoxConstraints(
        maxHeight: heightConstraint,
      ),
      child: Column(
        // contenido del espacio vacio que sale de abajo
        mainAxisSize: MainAxisSize.min, // para que no ocupe toda la pantalla si no es necesario
        children: [
          if (appBar != null)
            SizedBox(
              // espacio para la appbar
              height: appBarHeight,
              child: appBar,
            ),
          Container(
            // espacio para el contenido scrolleable
            constraints: BoxConstraints(
              maxHeight: contentHeight,
            ),
            child: SingleChildScrollView(
              // para que se pueda scrollear
              child: body,
            ),
          ),
          if (bottom != null)
            SizedBox(
              // espacio para el boton de abajo
              height: bottomHeight,
              child: bottom,
            ),
          SizedBox(
            // espacio para el teclado
            height: keyBoardSize,
          ),
        ],
      ),
    );
  }
}
