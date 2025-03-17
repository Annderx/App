import 'package:flutter/material.dart';

class PagoProvider with ChangeNotifier {
  List<Map<String, dynamic>> pagosPlanilla = [];
  List<Map<String, dynamic>> pagosSinPlanilla = [];

  void agregarPagoPlanilla(Map<String, dynamic> pago) {
    pagosPlanilla.add(pago);
    notifyListeners();
  }

  void agregarPagoSinPlanilla(Map<String, dynamic> pago) {
    pagosSinPlanilla.add(pago);
    notifyListeners();
  }
}