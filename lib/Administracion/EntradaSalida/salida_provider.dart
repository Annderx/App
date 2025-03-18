import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'ClasesSalida.dart';

class SalidaProvider extends ChangeNotifier {
  final List<Salida> _salidas = [];

  List<Salida> get salidas => _salidas;

  SalidaProvider() {
    _cargarSalidas(); // Cargar salidas guardadas al iniciar
  }

  Future<void> _cargarSalidas() async {
    final prefs = await SharedPreferences.getInstance();
    final String? data = prefs.getString('salidas');
    if (data != null) {
      final List<dynamic> jsonData = jsonDecode(data);
      _salidas.clear();
      _salidas.addAll(jsonData.map((item) => Salida.fromMap(item)).toList());
      notifyListeners();
    }
  }

  Future<void> _guardarSalidas() async {
    final prefs = await SharedPreferences.getInstance();
    final String data = jsonEncode(_salidas.map((e) => e.toMap()).toList());
    await prefs.setString('salidas', data);
  }

  void agregarSalida(Salida salida) {
    _salidas.add(salida);
    _guardarSalidas();
    notifyListeners();
  }

  void eliminarSalida(String codigoSalida) {
    _salidas.removeWhere((salida) => salida.codigoSalida == codigoSalida);
    _guardarSalidas();
    notifyListeners();
  }

  void actualizarSalida(Salida salidaActualizada) {
    final index = _salidas.indexWhere((salida) => salida.codigoSalida == salidaActualizada.codigoSalida);
    if (index != -1) {
      _salidas[index] = salidaActualizada;
      _guardarSalidas();
      notifyListeners();
    }
  }

  Future<List<Salida>> obtenerSalidas() async {
    await _cargarSalidas();
    return _salidas;
  }
}
