class FacturaCobrar {
  final String nroFactura;
  final String proveedor;
  final double monto;
  final String formaPago;
  final DateTime fecha;
  final double acuenta1;
  final double acuenta2;
  final double acuenta3;

  FacturaCobrar({
    required this.nroFactura,
    required this.proveedor,
    required this.monto,
    required this.formaPago,
    required this.fecha,
    required this.acuenta1,
    required this.acuenta2,
    required this.acuenta3,
  });

  /// 🔹 Método para calcular el saldo restante
  double get saldoPendiente => monto - (acuenta1 + acuenta2 + acuenta3);

  /// 🔹 Convierte el objeto a un `Map` para guardarlo en almacenamiento
  Map<String, dynamic> toMap() {
    return {
      'nroFactura': nroFactura,
      'proveedor': proveedor,
      'monto': monto,
      'formaPago': formaPago,
      'fecha': fecha.toIso8601String(), // Guardar como String ISO8601
      'acuenta1': acuenta1,
      'acuenta2': acuenta2,
      'acuenta3': acuenta3,
    };
  }

  /// 🔹 Crea una instancia de `FacturaCobrar` a partir de un `Map`
  factory FacturaCobrar.fromMap(Map<String, dynamic> map) {
    return FacturaCobrar(
      nroFactura: map['nroFactura'],
      proveedor: map['proveedor'],
      monto: map['monto'],
      formaPago: map['formaPago'],
      fecha: DateTime.parse(map['fecha']),
      acuenta1: map['acuenta1'],
      acuenta2: map['acuenta2'],
      acuenta3: map['acuenta3'],
    );
  }
}
