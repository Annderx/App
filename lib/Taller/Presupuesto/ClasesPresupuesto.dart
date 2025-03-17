class Presupuesto {
  final String noPresupuesto;
  final String vehiculo;
  final String anoFabricacion;
  final String modelo;
  final String anoModelo;
  final String marca;
  final String combustible;
  final String cliente;
  final String contacto;
  final DateTime? fechaIngreso;
  final String km;
  final String placa;
  final String precio;
  final String unidad;
  final String cantidad;
  final String tipo;
  final String opciones;
  final String repuestos;
  final String descripcion;
  final String subtotal;
  final String igv;
  final String total;

  Presupuesto({
    required this.noPresupuesto,
    required this.vehiculo,
    required this.anoFabricacion,
    required this.modelo,
    required this.anoModelo,
    required this.marca,
    required this.combustible,
    required this.cliente,
    required this.contacto,
    required this.fechaIngreso,
    required this.km,
    required this.placa,
    required this.precio,
    required this.unidad,
    required this.cantidad,
    required this.tipo,
    required this.opciones,
    required this.repuestos,
    required this.descripcion,
    required this.subtotal,
    required this.igv,
    required this.total,
  });

  // Métodos toJson() y fromJson() para serialización/deserialización
  Map<String, dynamic> toJson() {
    return {
      'noPresupuesto': noPresupuesto,
      'vehiculo': vehiculo,
      'anoFabricacion': anoFabricacion,
      'modelo': modelo,
      'anoModelo': anoModelo,
      'marca': marca,
      'combustible': combustible,
      'cliente': cliente,
      'contacto': contacto,
      'fechaIngreso': fechaIngreso?.toIso8601String(), // Convertir DateTime a String
      'km': km,
      'placa': placa,
      'precio': precio,
      'unidad': unidad,
      'cantidad': cantidad,
      'tipo': tipo,
      'opciones': opciones,
      'repuestos': repuestos,
      'descripcion': descripcion,
      'subtotal': subtotal,
      'igv': igv,
      'total': total,
    };
  }

  factory Presupuesto.fromJson(Map<String, dynamic> json) {
    return Presupuesto(
      noPresupuesto: json['noPresupuesto'],
      vehiculo: json['vehiculo'],
      anoFabricacion: json['anoFabricacion'],
      modelo: json['modelo'],
      anoModelo: json['anoModelo'],
      marca: json['marca'],
      combustible: json['combustible'],
      cliente: json['cliente'],
      contacto: json['contacto'],
      fechaIngreso: DateTime.parse(json['fechaIngreso']), // Convertir String a DateTime
      km: json['km'],
      placa: json['placa'],
      precio: json['precio'],
      unidad: json['unidad'],
      cantidad: json['cantidad'],
      tipo: json['tipo'],
      opciones: json['opciones'],
      repuestos: json['repuestos'],
      descripcion: json['descripcion'],
      subtotal: json['subtotal'],
      igv: json['igv'],
      total: json['total'],
    );
  }
}