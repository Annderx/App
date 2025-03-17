class Cotizacion {
  final int id;
  final String codCotizacion;
  final String cliente;
  final String tipoVehiculo;
  final String placa;
  final String marcaVehiculo;
  final String modeloVehiculo;
  final String empresaProveedor;
  final String rucProveedor;
  final String cotProv;
  final String proveedor;
  final String telefonoProveedor;
  final String marcaProducto;
  final String medidaProducto;
  final String descripcionProducto;
  final double precioProducto;
  final int cantidadProducto;
  final double subtotal;
  final double igv;
  final double total;
  final DateTime fecha;

  Cotizacion({
    required this.id,
    required this.codCotizacion,
    required this.cliente,
    required this.tipoVehiculo,
    required this.placa,
    required this.marcaVehiculo,
    required this.modeloVehiculo,
    required this.empresaProveedor,
    required this.rucProveedor,
    required this.cotProv,
    required this.proveedor,
    required this.telefonoProveedor,
    required this.marcaProducto,
    required this.medidaProducto,
    required this.descripcionProducto,
    required this.precioProducto,
    required this.cantidadProducto,
    required this.subtotal,
    required this.igv,
    required this.total,
    required this.fecha,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'codCotizacion': codCotizacion,
      'cliente': cliente,
      'tipoVehiculo': tipoVehiculo,
      'placa': placa,
      'marcaVehiculo': marcaVehiculo,
      'modeloVehiculo': modeloVehiculo,
      'empresaProveedor': empresaProveedor,
      'rucProveedor': rucProveedor,
      'cotProv': cotProv,
      'proveedor': proveedor,
      'telefonoProveedor': telefonoProveedor,
      'marcaProducto': marcaProducto,
      'medidaProducto': medidaProducto,
      'descripcionProducto': descripcionProducto,
      'precioProducto': precioProducto,
      'cantidadProducto': cantidadProducto,
      'subtotal': subtotal,
      'igv': igv,
      'total': total,
      'fecha': fecha.toIso8601String(),
    };
  }

  factory Cotizacion.fromJson(Map<String, dynamic> json) {
    return Cotizacion(
      id: json['id'],
      codCotizacion: json['codCotizacion'],
      cliente: json['cliente'],
      tipoVehiculo: json['tipoVehiculo'],
      placa: json['placa'],
      marcaVehiculo: json['marcaVehiculo'],
      modeloVehiculo: json['modeloVehiculo'],
      empresaProveedor: json['empresaProveedor'],
      rucProveedor: json['rucProveedor'],
      cotProv: json['cotProv'],
      proveedor: json['proveedor'],
      telefonoProveedor: json['telefonoProveedor'],
      marcaProducto: json['marcaProducto'],
      medidaProducto: json['medidaProducto'],
      descripcionProducto: json['descripcionProducto'],
      precioProducto: json['precioProducto'],
      cantidadProducto: json['cantidadProducto'],
      subtotal: json['subtotal'],
      igv: json['igv'],
      total: json['total'],
      fecha: DateTime.parse(json['fecha']),
    );
  }
}