class KardexEntry {
  final int id;
  final DateTime fecha;
  final String tipo; // Entrada o Salida
  final String codigoProducto;
  final String descripcionProducto;
  final int cantidad;
  final double precioUnitario;
  final double total;
  final String empleado;
  final String proveedorCliente;
  final String placaVehiculo;

  KardexEntry({
    required this.id,
    required this.fecha,
    required this.tipo,
    required this.codigoProducto,
    required this.descripcionProducto,
    required this.cantidad,
    required this.precioUnitario,
    required this.total,
    required this.empleado,
    required this.proveedorCliente,
    required this.placaVehiculo,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fecha': fecha.toIso8601String(),
      'tipo': tipo,
      'codigoProducto': codigoProducto,
      'descripcionProducto': descripcionProducto,
      'cantidad': cantidad,
      'precioUnitario': precioUnitario,
      'total': total,
      'empleado': empleado,
      'proveedorCliente': proveedorCliente,
      'placaVehiculo': placaVehiculo,
    };
  }

  factory KardexEntry.fromJson(Map<String, dynamic> json) {
    return KardexEntry(
      id: json['id'],
      fecha: DateTime.parse(json['fecha']),
      tipo: json['tipo'],
      codigoProducto: json['codigoProducto'],
      descripcionProducto: json['descripcionProducto'],
      cantidad: json['cantidad'],
      precioUnitario: json['precioUnitario'],
      total: json['total'],
      empleado: json['empleado'],
      proveedorCliente: json['proveedorCliente'],
      placaVehiculo: json['placaVehiculo'],
    );
  }
}