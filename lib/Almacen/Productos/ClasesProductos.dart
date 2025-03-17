class Producto {
  final int codigoProducto;
  final String descripcion;
  final String marca;
  final String ubicacion;
  final String objetivo;
  final int cantidad;
  final String categoria;
  final String unidad;
  final double precio;
  final String detalleMedida;

  Producto({
    required this.codigoProducto,
    required this.descripcion,
    required this.marca,
    required this.ubicacion,
    required this.objetivo,
    required this.cantidad,
    required this.categoria,
    required this.unidad,
    required this.precio,
    required this.detalleMedida,
  });

  Map<String, dynamic> toJson() {
    return {
      'codigoProducto': codigoProducto,
      'descripcion': descripcion,
      'marca': marca,
      'ubicacion': ubicacion,
      'objetivo': objetivo,
      'cantidad': cantidad,
      'categoria': categoria,
      'unidad': unidad,
      'precio': precio,
      'detalleMedida': detalleMedida,
    };
  }

  factory Producto.fromJson(Map<String, dynamic> json) {
    return Producto(
      codigoProducto: json['codigoProducto'],
      descripcion: json['descripcion'],
      marca: json['marca'],
      ubicacion: json['ubicacion'],
      objetivo: json['objetivo'],
      cantidad: json['cantidad'],
      categoria: json['categoria'],
      unidad: json['unidad'],
      precio: json['precio'],
      detalleMedida: json['detalleMedida'],
    );
  }
}