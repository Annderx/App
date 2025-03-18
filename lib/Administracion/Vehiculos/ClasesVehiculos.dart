class Vehiculo {
  final int id;
  final String codigoVehiculo;
  final String razonSocial;
  final String contacto;
  final String modelo;
  final String marca;
  final String combustible;
  final String tipoVehiculo;
  final String placa;
  final int anioFabricacion;
  final int anioModelo;
  final String nroMotor;
  final String vin;

  Vehiculo({
    required this.id,
    required this.codigoVehiculo,
    required this.razonSocial,
    required this.contacto,
    required this.modelo,
    required this.marca,
    required this.combustible,
    required this.tipoVehiculo,
    required this.placa,
    required this.anioFabricacion,
    required this.anioModelo,
    required this.nroMotor,
    required this.vin,
  });

  /// Convierte un JSON en una instancia de Vehiculo con validaciones
  factory Vehiculo.fromJson(Map<String, dynamic> json) {
    return Vehiculo(
      id: json['id'] ?? 0,
      codigoVehiculo: json['codigoVehiculo'] ?? 'SIN_CODIGO',
      razonSocial: json['razonSocial'] ?? 'Desconocido',
      contacto: json['contacto'] ?? 'No registrado',
      modelo: json['modelo'] ?? 'Desconocido',
      marca: json['marca'] ?? 'Desconocida',
      combustible: json['combustible'] ?? 'Desconocido',
      tipoVehiculo: json['tipoVehiculo'] ?? 'No especificado',
      placa: json['placa'] ?? 'No asignada',
      anioFabricacion: int.tryParse(json['anioFabricacion'].toString()) ?? 2000,
      anioModelo: int.tryParse(json['anioModelo'].toString()) ?? 2000,
      nroMotor: json['nroMotor'] ?? 'N/A',
      vin: json['vin'] ?? 'N/A',
    );
  }

  /// Convierte la instancia de Vehiculo en un JSON válido
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'codigoVehiculo': codigoVehiculo,
      'razonSocial': razonSocial,
      'contacto': contacto,
      'modelo': modelo,
      'marca': marca,
      'combustible': combustible,
      'tipoVehiculo': tipoVehiculo,
      'placa': placa,
      'anioFabricacion': anioFabricacion.toString(),
      'anioModelo': anioModelo.toString(),
      'nroMotor': nroMotor,
      'vin': vin,
    };
  }
}
