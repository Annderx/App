class Salida {
  final int? id;
  final String codigoSalida;
  final DateTime? fecha;
  final String codigoProducto;
  final String descripcion;
  final int cantidad;
  final double precio;
  final String marca;
  final String unidad;
  final String empleado;
  final String cliente;
  final String ubicacion;
  final String estado;

  const Salida({
    this.id,
    required this.codigoSalida,
    required this.fecha,
    required this.codigoProducto,
    required this.descripcion,
    required this.cantidad,
    required this.precio,
    required this.marca,
    required this.unidad,
    required this.empleado,
    required this.cliente,
    required this.ubicacion,
    required this.estado,
  }) : assert(cantidad > 0, 'La cantidad debe ser mayor que 0'),
       assert(precio >= 0, 'El precio no puede ser negativo');

  /// Convierte el objeto Salida a un mapa (para SQLite).
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'codigoSalida': codigoSalida,
      'fecha': fecha?.toIso8601String(),
      'codigoProducto': codigoProducto,
      'descripcion': descripcion,
      'cantidad': cantidad,
      'precio': precio,
      'marca': marca,
      'unidad': unidad,
      'empleado': empleado,
      'cliente': cliente,
      'ubicacion': ubicacion,
      'estado': estado,
    };
  }

  /// Crea un objeto Salida desde un mapa (para lectura desde SQLite).
  factory Salida.fromMap(Map<String, dynamic> map) {
    return Salida(
      id: map['id'],
      codigoSalida: map['codigoSalida'],
      fecha: map['fecha'] != null ? DateTime.parse(map['fecha']) : null,
      codigoProducto: map['codigoProducto'],
      descripcion: map['descripcion'],
      cantidad: map['cantidad'],
      precio: (map['precio'] as num).toDouble(),
      marca: map['marca'],
      unidad: map['unidad'],
      empleado: map['empleado'],
      cliente: map['cliente'],
      ubicacion: map['ubicacion'],
      estado: map['estado'],
    );
  }

  /// Permite modificar solo algunos campos sin crear un nuevo objeto completo.
  Salida copyWith({
    int? id,
    String? codigoSalida,
    DateTime? fecha,
    String? codigoProducto,
    String? descripcion,
    int? cantidad,
    double? precio,
    String? marca,
    String? unidad,
    String? empleado,
    String? cliente,
    String? ubicacion,
    String? estado,
  }) {
    return Salida(
      id: id ?? this.id,
      codigoSalida: codigoSalida ?? this.codigoSalida,
      fecha: fecha ?? this.fecha,
      codigoProducto: codigoProducto ?? this.codigoProducto,
      descripcion: descripcion ?? this.descripcion,
      cantidad: cantidad ?? this.cantidad,
      precio: precio ?? this.precio,
      marca: marca ?? this.marca,
      unidad: unidad ?? this.unidad,
      empleado: empleado ?? this.empleado,
      cliente: cliente ?? this.cliente,
      ubicacion: ubicacion ?? this.ubicacion,
      estado: estado ?? this.estado,
    );
  }
}
