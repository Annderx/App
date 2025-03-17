import 'package:flutter/material.dart';
import 'ClasesSalida.dart';

class SalidaProvider extends ChangeNotifier {
  final List<Salida> _salidas = [];

  List<Salida> get salidas => _salidas;

  void agregarSalida(Salida salida) {
    _salidas.add(salida);
    notifyListeners();
  }
}