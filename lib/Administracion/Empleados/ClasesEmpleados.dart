class Empleado {
  final int? id;
  final String codigo;
  final String nombre;
  final String area;
  final String tipo;
  final String funcion;
  final String condicion;
  final String telefono;
  final String dni;
  final String direccion;
  final double sueldo;
  final int edad;
  final DateTime? fechaNacimiento;

  const Empleado({
    this.id,
    required this.codigo,
    required this.nombre,
    required this.area,
    required this.tipo,
    required this.funcion,
    required this.condicion,
    required this.telefono,
    required this.dni,
    required this.direccion,
    required this.sueldo,
    required this.edad,
    this.fechaNacimiento,
  }) : assert(edad > 0, 'La edad debe ser mayor que 0');

  /// Convierte el objeto Empleado a un mapa (para SQLite).
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'codigo': codigo,
      'nombre': nombre,
      'area': area,
      'tipo': tipo,
      'funcion': funcion,
      'condicion': condicion,
      'telefono': telefono,
      'dni': dni,
      'direccion': direccion,
      'sueldo': sueldo,
      'edad': edad,
      'fechaNacimiento': fechaNacimiento?.toIso8601String(),
    };
  }

  /// Crea un objeto Empleado desde un mapa (para lectura de SQLite).
  factory Empleado.fromMap(Map<String, dynamic> map) {
    return Empleado(
      id: map['id'],
      codigo: map['codigo'],
      nombre: map['nombre'],
      area: map['area'],
      tipo: map['tipo'],
      funcion: map['funcion'],
      condicion: map['condicion'],
      telefono: map['telefono'],
      dni: map['dni'],
      direccion: map['direccion'],
      sueldo: (map['sueldo'] as num).toDouble(),
      edad: map['edad'],
      fechaNacimiento: map['fechaNacimiento'] != null
          ? DateTime.parse(map['fechaNacimiento'])
          : null,
    );
  }

  /// Permite modificar solo algunos campos de un Empleado sin crear un objeto nuevo.
  Empleado copyWith({
    int? id,
    String? codigo,
    String? nombre,
    String? area,
    String? tipo,
    String? funcion,
    String? condicion,
    String? telefono,
    String? dni,
    String? direccion,
    double? sueldo,
    int? edad,
    DateTime? fechaNacimiento,
  }) {
    return Empleado(
      id: id ?? this.id,
      codigo: codigo ?? this.codigo,
      nombre: nombre ?? this.nombre,
      area: area ?? this.area,
      tipo: tipo ?? this.tipo,
      funcion: funcion ?? this.funcion,
      condicion: condicion ?? this.condicion,
      telefono: telefono ?? this.telefono,
      dni: dni ?? this.dni,
      direccion: direccion ?? this.direccion,
      sueldo: sueldo ?? this.sueldo,
      edad: edad ?? this.edad,
      fechaNacimiento: fechaNacimiento ?? this.fechaNacimiento,
    );
  }
}
