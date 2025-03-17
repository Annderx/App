class PrestamoProducto {
  final int codigoPrestamo;
  final int codigoEncargado;
  final String nombre;
  final String descripcion;
  final DateTime fechaPrestamo;
  final DateTime? fechaDevolucion;
  final String medida;
  final int cantidad;
  final String prestatario;

  PrestamoProducto({
    required this.codigoPrestamo,
    required this.codigoEncargado,
    required this.nombre,
    required this.descripcion,
    required this.fechaPrestamo,
    this.fechaDevolucion,
    required this.medida,
    required this.cantidad,
    required this.prestatario,
  });

  Map<String, dynamic> toJson() {
    return {
      'codigoPrestamo': codigoPrestamo,
      'codigoEncargado': codigoEncargado,
      'nombre': nombre,
      'descripcion': descripcion,
      'fechaPrestamo': fechaPrestamo.toIso8601String(),
      'fechaDevolucion': fechaDevolucion?.toIso8601String(),
      'medida': medida,
      'cantidad': cantidad,
      'prestatario': prestatario,
    };
  }

  factory PrestamoProducto.fromJson(Map<String, dynamic> json) {
    return PrestamoProducto(
      codigoPrestamo: json['codigoPrestamo'],
      codigoEncargado: json['codigoEncargado'],
      nombre: json['nombre'],
      descripcion: json['descripcion'],
      fechaPrestamo: DateTime.parse(json['fechaPrestamo']),
      fechaDevolucion: json['fechaDevolucion'] != null
          ? DateTime.parse(json['fechaDevolucion'])
          : null,
      medida: json['medida'],
      cantidad: json['cantidad'],
      prestatario: json['prestatario'],
    );
  }
}