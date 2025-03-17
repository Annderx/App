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

  factory Producto.fromJson(Map<String, dynamic> json) {
    return Producto(
      id: json['id'],
      nombre: json['nombre'],
      tipo: json['tipo'],
      fecha: DateTime.parse(json['fecha']),
      cantidad: json['cantidad'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'tipo': tipo,
      'fecha': fecha.toIso8601String(),
      'cantidad': cantidad,
    };
  }
}