class AreaTrabajo {
  final int codigoArea;
  final String nombre;

  AreaTrabajo({
    required this.codigoArea,
    required this.nombre,
  });

  Map<String, dynamic> toJson() {
    return {
      'codigoArea': codigoArea,
      'nombre': nombre,
    };
  }

  factory AreaTrabajo.fromJson(Map<String, dynamic> json) {
    return AreaTrabajo(
      codigoArea: json['codigoArea'],
      nombre: json['nombre'],
    );
  }
}