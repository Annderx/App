import 'package:flutter/material.dart';
import 'ClasesProductos.dart';

class ProductoProvider with ChangeNotifier {
  final List<Producto> _productos = [];

  List<Producto> get productos => List.unmodifiable(_productos); // Evita modificaciones externas

  void agregarProducto(Producto producto) {
    _productos.add(producto);
    notifyListeners();
  }

  void eliminarProducto(int id) {
    _productos.removeWhere((producto) => producto.id == id);
    notifyListeners();
  }

  void actualizarProducto(Producto productoActualizado) {
    int index = _productos.indexWhere((producto) => producto.id == productoActualizado.id);
    if (index != -1) {
      _productos[index] = productoActualizado;
      notifyListeners();
    }
  }

  Producto? obtenerProductoPorId(int id) {
  try {
    return _productos.firstWhere((producto) => producto.id == id);
  } catch (e) {
    return null; // Devuelve `null` si no encuentra el producto
  }
}

  List<Producto> buscarPorCategoria(String categoria) {
    return _productos.where((producto) => producto.categoria.toLowerCase() == categoria.toLowerCase()).toList();
  }

  List<Producto> buscarPorMarca(String marca) {
    return _productos.where((producto) => producto.marca.toLowerCase().contains(marca.toLowerCase())).toList();
  }

  void limpiarProductos() {
    _productos.clear();
    notifyListeners();
  }
}
