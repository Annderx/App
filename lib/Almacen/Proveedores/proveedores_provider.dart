import 'package:flutter/material.dart';
import 'ClasesProveedores.dart';

class ProveedorProviderAlmacen with ChangeNotifier {
  final List<Proveedor> _proveedores = [];

  List<Proveedor> get proveedores => _proveedores;

  void agregarProveedor(Proveedor proveedor) {
    _proveedores.add(proveedor);
    notifyListeners();
  }

  // Puedes agregar métodos para filtrar y buscar proveedores
}