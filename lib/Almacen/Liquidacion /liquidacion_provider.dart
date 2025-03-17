import 'package:flutter/material.dart';
import 'ClasesLiquidacion.dart';

class LiquidacionProviderAlmacen with ChangeNotifier {
  final List<LiquidacionProducto> _liquidaciones = [];

  List<LiquidacionProducto> get liquidaciones => _liquidaciones;

  void agregarLiquidacion(LiquidacionProducto liquidacion) {
    _liquidaciones.add(liquidacion);
    notifyListeners();
  }

  // Puedes agregar métodos para filtrar y buscar liquidaciones
}