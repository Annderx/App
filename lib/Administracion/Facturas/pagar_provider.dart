import 'package:flutter/material.dart';
import 'FacturasPagar.dart';

class FacturaPagarProvider with ChangeNotifier {
  final List<FacturaPagar> _facturas = [];

  List<FacturaPagar> get facturas => _facturas;

  void agregarFactura(FacturaPagar factura) {
    _facturas.add(factura);
    notifyListeners();
  }
}