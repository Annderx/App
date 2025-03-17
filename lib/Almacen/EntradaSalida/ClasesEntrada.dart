class EntradaProducto {
  final int id;
  final String codigoEntrada;
  final String codigoProducto;
  final String descripcionProducto;
  final int cantidadProducto;
  final double precioProducto;
  final String marcaProducto;
  final String unidadProducto;
  final String empleado;
  final String proveedor;
  final String cliente;
  final String placaVehiculo;
  final DateTime fecha;

  EntradaProducto({
    required this.id,
    required this.codigoEntrada,
    required this.codigoProducto,
    required this.descripcionProducto,
    required this.cantidadProducto,
    required this.precioProducto,
    required this.marcaProducto,
    required this.unidadProducto,
    required this.empleado,
    required this.proveedor,
    required this.cliente,
    required this.placaVehiculo,
    required this.fecha,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'codigoEntrada': codigoEntrada,
      'codigoProducto': codigoProducto,
      'descripcionProducto': descripcionProducto,
      'cantidadProducto': cantidadProducto,
      'precioProducto': precioProducto,
      'marcaProducto': marcaProducto,
      'unidadProducto': unidadProducto,
      'empleado': empleado,
      'proveedor': proveedor,
      'cliente': cliente,
      'placaVehiculo': placaVehiculo,
      'fecha': fecha.toIso8601String(),
    };
  }

  factory EntradaProducto.fromJson(Map<String, dynamic> json) {
    return EntradaProducto(
      id: json['id'],
      codigoEntrada: json['codigoEntrada'],
      codigoProducto: json['codigoProducto'],
      descripcionProducto: json['descripcionProducto'],
      cantidadProducto: json['cantidadProducto'],
      precioProducto: json['precioProducto'],
      marcaProducto: json['marcaProducto'],
      unidadProducto: json['unidadProducto'],
      empleado: json['empleado'],
      proveedor: json['proveedor'],
      cliente: json['cliente'],
      placaVehiculo: json['placaVehiculo'],
      fecha: DateTime.parse(json['fecha']),
    );
  }
}