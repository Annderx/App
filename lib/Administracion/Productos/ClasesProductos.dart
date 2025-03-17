class Producto {
  final int id;
  final String codigoProducto;
  final String descripcion;
  final String marca;
  final String objetivo;
  final int cantidad;
  final String categoria;
  final String unidad;
  final double precio;
  final String detalleMedida;
  final String referencia;
  final String ubicacion;

  Producto({
    required this.id,
    required this.codigoProducto,
    required this.descripcion,
    required this.marca,
    required this.objetivo,
    required this.cantidad,
    required this.categoria,
    required this.unidad,
    required this.precio,
    required this.detalleMedida,
    required this.referencia,
    required this.ubicacion,
  });

  factory Producto.fromJson(Map<String, dynamic> json) {
    return Producto(
      id: json['id'],
      codigoProducto: json['codigoProducto'],
      descripcion: json['descripcion'],
      marca: json['marca'],
      objetivo: json['objetivo'],
      cantidad: json['cantidad'],
      categoria: json['categoria'],
      unidad: json['unidad'],
      precio: json['precio'].toDouble(),
      detalleMedida: json['detalleMedida'],
      referencia: json['referencia'],
      ubicacion: json['ubicacion'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'codigoProducto': codigoProducto,
      'descripcion': descripcion,
      'marca': marca,
      'objetivo': objetivo,
      'cantidad': cantidad,
      'categoria': categoria,
      'unidad': unidad,
      'precio': precio,
      'detalleMedida': detalleMedida,
      'referencia': referencia,
      'ubicacion': ubicacion,
    };
  }
}