import 'package:flutter/material.dart';
import 'ClasesEntrada.dart';

class EntradaProviderAlmacen with ChangeNotifier {
  final List<EntradaProducto> _entradas = [];

  List<EntradaProducto> get entradas => _entradas;

  void agregarEntrada(EntradaProducto entrada) {
    _entradas.add(entrada);
    notifyListeners();
  }

  // Puedes agregar métodos para cargar y guardar entradas desde una base de datos o API
}