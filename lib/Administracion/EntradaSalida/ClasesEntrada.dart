class Entrada {
  final int? id;
  final String codigoEntrada;
  final DateTime? fecha;
  final String codigoProducto;
  final String descripcion;
  final int cantidad;
  final double precio;
  final String marca;
  final String unidad;
  final String proveedor;

  const Entrada({
    this.id,
    required this.codigoEntrada,
    required this.fecha,
    required this.codigoProducto,
    required this.descripcion,
    required this.cantidad,
    required this.precio,
    required this.marca,
    required this.unidad,
    required this.proveedor,
  }) : assert(cantidad > 0, 'La cantidad debe ser mayor que 0'),
       assert(precio >= 0, 'El precio no puede ser negativo');

  /// Convierte el objeto Entrada a un mapa (para SQLite).
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'codigoEntrada': codigoEntrada,
      'fecha': fecha?.toIso8601String(),
      'codigoProducto': codigoProducto,
      'descripcion': descripcion,
      'cantidad': cantidad,
      'precio': precio,
      'marca': marca,
      'unidad': unidad,
      'proveedor': proveedor,
    };
  }

  /// Crea un objeto Entrada desde un mapa (para lectura desde SQLite).
  factory Entrada.fromMap(Map<String, dynamic> map) {
    return Entrada(
      id: map['id'],
      codigoEntrada: map['codigoEntrada'],
      fecha: map['fecha'] != null ? DateTime.parse(map['fecha']) : null,
      codigoProducto: map['codigoProducto'],
      descripcion: map['descripcion'],
      cantidad: map['cantidad'],
      precio: (map['precio'] as num).toDouble(),
      marca: map['marca'],
      unidad: map['unidad'],
      proveedor: map['proveedor'],
    );
  }

  /// Permite modificar solo algunos campos sin crear un nuevo objeto completo.
  Entrada copyWith({
    int? id,
    String? codigoEntrada,
    DateTime? fecha,
    String? codigoProducto,
    String? descripcion,
    int? cantidad,
    double? precio,
    String? marca,
    String? unidad,
    String? proveedor,
  }) {
    return Entrada(
      id: id ?? this.id,
      codigoEntrada: codigoEntrada ?? this.codigoEntrada,
      fecha: fecha ?? this.fecha,
      codigoProducto: codigoProducto ?? this.codigoProducto,
      descripcion: descripcion ?? this.descripcion,
      cantidad: cantidad ?? this.cantidad,
      precio: precio ?? this.precio,
      marca: marca ?? this.marca,
      unidad: unidad ?? this.unidad,
      proveedor: proveedor ?? this.proveedor,
    );
  }
}
