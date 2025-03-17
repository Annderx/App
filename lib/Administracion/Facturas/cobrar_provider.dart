import 'package:flutter/material.dart';
import 'FacturasCobrar.dart';

class FacturaCobrarProvider with ChangeNotifier {
  final List<FacturaCobrar> _facturas = [];

  List<FacturaCobrar> get facturas => _facturas;

  void agregarFactura(FacturaCobrar factura) {
    _facturas.add(factura);
    notifyListeners();
  }
}