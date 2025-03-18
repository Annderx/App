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

  /// 🔹 **Factory para convertir desde JSON**
  factory Producto.fromJson(Map<String, dynamic> json) => Producto(
        id: json['id'] as int,
        codigoProducto: json['codigoProducto'] as String,
        descripcion: json['descripcion'] as String,
        marca: json['marca'] as String,
        objetivo: json['objetivo'] as String,
        cantidad: (json['cantidad'] as num).toInt(),
        categoria: json['categoria'] as String,
        unidad: json['unidad'] as String,
        precio: (json['precio'] as num).toDouble(),
        detalleMedida: json['detalleMedida'] as String,
        referencia: json['referencia'] as String,
        ubicacion: json['ubicacion'] as String,
      );

  /// 🔹 **Método para convertir a JSON**
  Map<String, dynamic> toJson() => {
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

  /// 🔹 **Método `copyWith` para facilitar actualizaciones**
  Producto copyWith({
    int? id,
    String? codigoProducto,
    String? descripcion,
    String? marca,
    String? objetivo,
    int? cantidad,
    String? categoria,
    String? unidad,
    double? precio,
    String? detalleMedida,
    String? referencia,
    String? ubicacion,
  }) {
    return Producto(
      id: id ?? this.id,
      codigoProducto: codigoProducto ?? this.codigoProducto,
      descripcion: descripcion ?? this.descripcion,
      marca: marca ?? this.marca,
      objetivo: objetivo ?? this.objetivo,
      cantidad: cantidad ?? this.cantidad,
      categoria: categoria ?? this.categoria,
      unidad: unidad ?? this.unidad,
      precio: precio ?? this.precio,
      detalleMedida: detalleMedida ?? this.detalleMedida,
      referencia: referencia ?? this.referencia,
      ubicacion: ubicacion ?? this.ubicacion,
    );
  }
}
