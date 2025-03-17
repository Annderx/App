import 'package:flutter/material.dart';
import 'ClasesProductos.dart';

class ProductoProvider with ChangeNotifier {
  final List<Producto> _productos = [];

  List<Producto> get productos => _productos;

  void agregarProducto(Producto producto) {
    _productos.add(producto);
    notifyListeners();
  }

  // Métodos adicionales para cargar datos desde una API o base de datos
  // ...
}