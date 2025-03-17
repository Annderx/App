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
  final String anioFabricacion;
  final String anioModelo;
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

  factory Vehiculo.fromJson(Map<String, dynamic> json) {
    return Vehiculo(
      id: json['id'],
      codigoVehiculo: json['codigoVehiculo'],
      razonSocial: json['razonSocial'],
      contacto: json['contacto'],
      modelo: json['modelo'],
      marca: json['marca'],
      combustible: json['combustible'],
      tipoVehiculo: json['tipoVehiculo'],
      placa: json['placa'],
      anioFabricacion: json['anioFabricacion'],
      anioModelo: json['anioModelo'],
      nroMotor: json['nroMotor'],
      vin: json['vin'],
    );
  }

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
      'anioFabricacion': anioFabricacion,
      'anioModelo': anioModelo,
      'nroMotor': nroMotor,
      'vin': vin,
    };
  }
}