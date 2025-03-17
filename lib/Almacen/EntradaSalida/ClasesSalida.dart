class SalidaProducto {
  final int id;
  final String codigoSalida;
  final String codigoProducto;
  final String descripcion;
  final String marca;
  final String unidad;
  final int cantidad;
  final String ubicacion;
  final double precio;
  final String empleado;
  final String placaVehiculo;
  final String estado;
  final DateTime fecha;

  SalidaProducto({
    required this.id,
    required this.codigoSalida,
    required this.codigoProducto,
    required this.descripcion,
    required this.marca,
    required this.unidad,
    required this.cantidad,
    required this.ubicacion,
    required this.precio,
    required this.empleado,
    required this.placaVehiculo,
    required this.estado,
    required this.fecha,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'codigoSalida': codigoSalida,
      'codigoProducto': codigoProducto,
      'descripcion': descripcion,
      'marca': marca,
      'unidad': unidad,
      'cantidad': cantidad,
      'ubicacion': ubicacion,
      'precio': precio,
      'empleado': empleado,
      'placaVehiculo': placaVehiculo,
      'estado': estado,
      'fecha': fecha.toIso8601String(),
    };
  }

  factory SalidaProducto.fromJson(Map<String, dynamic> json) {
    return SalidaProducto(
      id: json['id'],
      codigoSalida: json['codigoSalida'],
      codigoProducto: json['codigoProducto'],
      descripcion: json['descripcion'],
      marca: json['marca'],
      unidad: json['unidad'],
      cantidad: json['cantidad'],
      ubicacion: json['ubicacion'],
      precio: json['precio'],
      empleado: json['empleado'],
      placaVehiculo: json['placaVehiculo'],
      estado: json['estado'],
      fecha: DateTime.parse(json['fecha']),
    );
  }
}