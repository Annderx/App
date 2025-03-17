import 'package:flutter/material.dart';
import 'ClasesPrestamos.dart';

class PrestamoProviderAlmacen with ChangeNotifier {
  final List<PrestamoProducto> _prestamos = [];

  List<PrestamoProducto> get prestamos => _prestamos;

  void agregarPrestamo(PrestamoProducto prestamo) {
    _prestamos.add(prestamo);
    notifyListeners();
  }

  // Puedes agregar métodos para filtrar y buscar préstamos
}