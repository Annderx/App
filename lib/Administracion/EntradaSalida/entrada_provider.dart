import 'package:flutter/material.dart';
import 'ClasesEntrada.dart'; // Asegúrate de que la ruta sea correcta

class EntradaProvider extends ChangeNotifier {
  final List<Entrada> _entradas = [];

  List<Entrada> get entradas => _entradas;

  void agregarEntrada(Entrada entrada) {
    _entradas.add(entrada);
    notifyListeners();
  }

  // Puedes agregar más métodos para modificar o eliminar entradas si es necesario
}