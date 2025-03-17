class Asistencia {
  final DateTime fecha;
  final String nombreEmpleado;
  final String horaEntrada;
  final String horaSalida;
  final String notas;

  Asistencia({
    required this.fecha,
    required this.nombreEmpleado,
    required this.horaEntrada,
    required this.horaSalida,
    required this.notas,
  });

  Map<String, dynamic> toJson() {
    return {
      'fecha': fecha.toIso8601String(),
      'nombreEmpleado': nombreEmpleado,
      'horaEntrada': horaEntrada,
      'horaSalida': horaSalida,
      'notas': notas,
    };
  }

  factory Asistencia.fromJson(Map<String, dynamic> json) {
    return Asistencia(
      fecha: DateTime.parse(json['fecha']),
      nombreEmpleado: json['nombreEmpleado'],
      horaEntrada: json['horaEntrada'],
      horaSalida: json['horaSalida'],
      notas: json['notas'],
    );
  }
}