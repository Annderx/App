import 'package:flutter/material.dart';
import 'package:myapp/RRHH/Pagos/ClasesPagosConplanilla.dart';

class PagosPlanillaProvider with ChangeNotifier {
  final List<PagoPlanilla> _pagos = [];

  List<PagoPlanilla> get pagos => _pagos;

  void agregarPago(PagoPlanilla pago) {
    _pagos.add(pago);
    notifyListeners();
  }
}