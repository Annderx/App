import 'package:flutter/material.dart';
import 'ClasesPagosSinplanilla.dart';

class PagosSinPlanillaProvider with ChangeNotifier {
  final List<PagoSinPlanilla> _pagos = [];

  List<PagoSinPlanilla> get pagos => _pagos;

  void agregarPago(PagoSinPlanilla pago) {
    _pagos.add(pago);
    notifyListeners();
  }
}