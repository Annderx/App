import 'package:flutter/material.dart';
import "package:myapp/Almacen/Productos/ClasesProductos.dart";

class ProductoProvider with ChangeNotifier {
  final List<Producto> _productos = [];

  List<Producto> get productos => _productos;

  void agregarProducto(Producto producto) {
    _productos.add(producto);
    notifyListeners();
  }

  // Puedes agregar métodos para filtrar y buscar productos
}
