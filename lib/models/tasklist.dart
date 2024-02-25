class ListaDeTareas {
  const ListaDeTareas({
    this.id,
    required this.nombre,
    required this.idsDeUsuarios,
    required this.tareasConFechaLimite,
    required this.fechaLimite,
    this.cantidadDeTareas = 0,
    this.tareasCompletadas = 0,
  });

  final String? id;
  final String nombre;
  final List<String> idsDeUsuarios;
  final bool tareasConFechaLimite;
  final DateTime? fechaLimite;
  final int cantidadDeTareas;
  final int tareasCompletadas;

  factory ListaDeTareas.fromJson(Map<String, dynamic> json, [String? id]) {
    //factory porque construye objeto Lista, por eso tiene el Lista.
    return ListaDeTareas(
      id: id,
      nombre: json['nombre'] as String,
      idsDeUsuarios: (json['usuarios'] as List<dynamic>).map((e) => e.toString()).toList(),
      tareasConFechaLimite: json['tareas_con_fecha_limite'] as bool,
      fechaLimite: json['fecha_limite'] != null ? DateTime.parse(json['global_deadline'] as String) : null,
      cantidadDeTareas: json['cantidad_de_tareas'] as int? ?? 0,
      tareasCompletadas: json['tareas_completadas'] as int? ?? 0,
    );
  }

  // Getter que dice si tiene o no deadline inferido de si es null o no
  bool get hasDeadline => fechaLimite != null;

  Map<String, dynamic> toJson() {
    //convierte la lista a un json
    return {
      "nombre": nombre,
      "usuarios": idsDeUsuarios,
      "tareas_con_fecha_limite": tareasConFechaLimite,
      "fecha_limite": fechaLimite?.toIso8601String(),
      "cantidad_de_tareas": cantidadDeTareas,
      "tareas_completadas": tareasCompletadas,
      // Faltan las tareas
    };
  }
}
