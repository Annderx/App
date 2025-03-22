class LiquidacionProducto {
  final int codigoLiquidacion;
  final DateTime fechaEntrega;
  final String tipoDocumento;
  final String condicion;
  final String motivo;
  final String sistema;
  final String proforma;
  final String solicitudPedido;
  final String arf;
  final String familia;
  final String descripcionProducto;
  final String medidaProducto;
  final String ubicacionProducto;
  final String marcaProducto;
  final double precioProducto;
  final int cantidadProducto;
  final double totalSoles;
  final double cotDolar;
  final double totalDolares;
  final String recepcionMaterial;
  final String empleado;
  final String placaVehiculo;
  final String vehiculo;
  final String marcaVehiculo;
  final String modeloVehiculo;
  final String cliente;
  final String proveedor;
  final DateTime fechaRegistro;
  final String area;
  final DateTime fechaSalida;
  final String categoria;

  LiquidacionProducto({
    required this.codigoLiquidacion,
    required this.fechaEntrega,
    required this.tipoDocumento,
    required this.condicion,
    required this.motivo,
    required this.sistema,
    required this.proforma,
    required this.solicitudPedido,
    required this.arf,
    required this.familia,
    required this.descripcionProducto,
    required this.medidaProducto,
    required this.ubicacionProducto,
    required this.marcaProducto,
    required this.precioProducto,
    required this.cantidadProducto,
    required this.totalSoles,
    required this.cotDolar,
    required this.totalDolares,
    required this.recepcionMaterial,
    required this.empleado,
    required this.placaVehiculo,
    required this.vehiculo,
    required this.marcaVehiculo,
    required this.modeloVehiculo,
    required this.cliente,
    required this.proveedor,
    required this.fechaRegistro,
    required this.area,
    required this.fechaSalida,
    required this.categoria,
  });

  Map<String, dynamic> toJson() {
    return {
      'codigoLiquidacion': codigoLiquidacion,
      'fechaEntrega': fechaEntrega.toIso8601String(),
      'tipoDocumento': tipoDocumento,
      'condicion': condicion,
      'motivo': motivo,
      'sistema': sistema,
      'proforma': proforma,
      'solicitudPedido': solicitudPedido,
      'arf': arf,
      'familia': familia,
      'descripcionProducto': descripcionProducto,
      'medidaProducto': medidaProducto,
      'ubicacionProducto': ubicacionProducto,
      'marcaProducto': marcaProducto,
      'precioProducto': precioProducto,
      'cantidadProducto': cantidadProducto,
      'totalSoles': totalSoles,
      'cotDolar': cotDolar,
      'totalDolares': totalDolares,
      'recepcionMaterial': recepcionMaterial,
      'empleado': empleado,
      'placaVehiculo': placaVehiculo,
      'vehiculo': vehiculo,
      'marcaVehiculo': marcaVehiculo,
      'modeloVehiculo': modeloVehiculo,
      'cliente': cliente,
      'proveedor': proveedor,
      'fechaRegistro': fechaRegistro.toIso8601String(),
      'area': area,
      'fechaSalida': fechaSalida.toIso8601String(),
      'categoria': categoria,
    };
  }

  factory LiquidacionProducto.fromJson(Map<String, dynamic> json) {
    return LiquidacionProducto(
      codigoLiquidacion: json['codigoLiquidacion'],
      fechaEntrega: DateTime.parse(json['fechaEntrega']),
      tipoDocumento: json['tipoDocumento'],
      condicion: json['condicion'],
      motivo: json['motivo'],
      sistema: json['sistema'],
      proforma: json['proforma'],
      solicitudPedido: json['solicitudPedido'],
      arf: json['arf'],
      familia: json['familia'],
      descripcionProducto: json['descripcionProducto'],
      medidaProducto: json['medidaProducto'],
      ubicacionProducto: json['ubicacionProducto'],
      marcaProducto: json['marcaProducto'],
      precioProducto: json['precioProducto'],
      cantidadProducto: json['cantidadProducto'],
      totalSoles: json['totalSoles'],
      cotDolar: json['cotDolar'],
      totalDolares: json['totalDolares'],
      recepcionMaterial: json['recepcionMaterial'],
      empleado: json['empleado'],
      placaVehiculo: json['placaVehiculo'],
      vehiculo: json['vehiculo'],
      marcaVehiculo: json['marcaVehiculo'],
      modeloVehiculo: json['modeloVehiculo'],
      cliente: json['cliente'],
      proveedor: json['proveedor'],
      fechaRegistro: DateTime.parse(json['fechaRegistro']),
      area: json['area'],
      fechaSalida: DateTime.parse(json['fechaSalida']),
      categoria: json['categoria'],
    );
  }
}