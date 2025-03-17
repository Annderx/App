import 'package:flutter/material.dart';
import 'ClasesSalida.dart';

class SalidaProviderAlmacen with ChangeNotifier {
  final List<SalidaProducto> _salidas = [];

  List<SalidaProducto> get salidas => _salidas;

  void agregarSalida(SalidaProducto salida) {
    _salidas.add(salida);
    notifyListeners();
  }

  // Puedes agregar métodos para cargar y guardar salidas desde una base de datos o API
}