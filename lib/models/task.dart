import 'package:cloud_firestore/cloud_firestore.dart';

class Tarea {
  final String? id;
  final String nombre;
  final DateTime? fechaLimite;
  final String? usuarioAsignado;
  final bool completada;
  final String? completedBy;

  const Tarea({
    this.id,
    required this.nombre,
    required this.fechaLimite,
    required this.usuarioAsignado,
    this.completada = false,
    this.completedBy,
  });

  Map<String, dynamic> toJson() {
    //convierte el objeto a un json
    return {
      'id': id,
      'title': nombre,
      'deadline': fechaLimite,
      'assigned_user': usuarioAsignado,
      'completed': completada,
      'completed_by': completedBy,
    };
  }

  factory Tarea.fromJson(Map<String, dynamic> json, [String? id]) {
    //factory porque construye objetos Tarea, a partir de un json, por eso tiene el Tarea.
    return Tarea(
      id: id,
      nombre: json['nombre'],
      fechaLimite: (json['dfechaLimite'] as Timestamp?)?.toDate(),
      usuarioAsignado: json['usuarioAsignado'],
      completada: json['completada'],
      completedBy: json['completed_by'],
    );
  }

  Tarea copyWith({
    //copia la tarea y le cambia los valores que se le pasen
    String? id,
    String? nombre,
    DateTime? fechaLimite,
    String? usuarioAsignado,
    bool? completada,
    String? completedBy,
  }) {
    return Tarea(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      fechaLimite: fechaLimite ?? this.fechaLimite,
      usuarioAsignado: usuarioAsignado ?? this.usuarioAsignado,
      completada: completada ?? this.completada,
      completedBy: completedBy ?? this.completedBy,
    );
  }

  @override
  String toString() {
    //para el print
    return 'Task(nombre: $nombre, fechaLimite: $fechaLimite, usuarioAsignado: $usuarioAsignado, completada: $completada)';
  }

  @override
  bool operator ==(Object other) {
    //compara si dos tareas son iguales
    if (identical(this, other)) return true;

    return other is Tarea &&
        other.nombre == nombre &&
        other.fechaLimite == fechaLimite &&
        other.usuarioAsignado == usuarioAsignado &&
        other.completada == completada;
  }

  @override
  int get hashCode {
    return nombre.hashCode ^ fechaLimite.hashCode ^ usuarioAsignado.hashCode ^ completada.hashCode;
  }

  bool getCompleted() {
    //retorna si la tarea esta completada
    return completada;
  }
}
