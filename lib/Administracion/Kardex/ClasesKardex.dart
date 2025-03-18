class Producto {
  final int id;
  final String nombre;
  final String tipo; // 'Entrada' o 'Salida'
  final DateTime fecha;
  final int cantidad;

  Producto({
    required this.id,
    required this.nombre,
    required this.tipo,
    required this.fecha,
    required this.cantidad,
  });

  /// 🔹 Convierte un JSON a un objeto Producto
  factory Producto.fromJson(Map<String, dynamic> json) {
    return Producto(
      id: json['id'] as int,
      nombre: json['nombre'] as String,
      tipo: json['tipo'] as String,
      fecha: DateTime.tryParse(json['fecha'] ?? '') ?? DateTime.now(),
      cantidad: json['cantidad'] as int,
    );
  }

  /// 🔹 Convierte un objeto Producto a JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'tipo': tipo,
      'fecha': fecha.toIso8601String(),
      'cantidad': cantidad,
    };
  }

  /// 🔹 Crea una copia del Producto con valores actualizados
  Producto copyWith({
    int? id,
    String? nombre,
    String? tipo,
    DateTime? fecha,
    int? cantidad,
  }) {
    return Producto(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      tipo: tipo ?? this.tipo,
      fecha: fecha ?? this.fecha,
      cantidad: cantidad ?? this.cantidad,
    );
  }
}
