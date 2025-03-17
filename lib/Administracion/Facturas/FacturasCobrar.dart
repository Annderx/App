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
}