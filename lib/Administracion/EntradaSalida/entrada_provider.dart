import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'ClasesEntrada.dart';

class EntradaProvider extends ChangeNotifier {
  final List<Entrada> _entradas = [];

  List<Entrada> get entradas => _entradas;

  EntradaProvider() {
    _cargarEntradas(); // Cargar entradas guardadas al iniciar
  }

  Future<void> _cargarEntradas() async {
    final prefs = await SharedPreferences.getInstance();
    final String? data = prefs.getString('entradas');
    if (data != null) {
      final List<dynamic> jsonData = jsonDecode(data);
      _entradas.clear();
      _entradas.addAll(jsonData.map((item) => Entrada.fromMap(item)).toList());
      notifyListeners();
    }
  }

  Future<void> _guardarEntradas() async {
    final prefs = await SharedPreferences.getInstance();
    final String data = jsonEncode(_entradas.map((e) => e.toMap()).toList());
    await prefs.setString('entradas', data);
  }

  void agregarEntrada(Entrada entrada) {
    _entradas.add(entrada);
    _guardarEntradas();
    notifyListeners();
  }

  void eliminarEntrada(String codigoEntrada) {
    _entradas.removeWhere((entrada) => entrada.codigoEntrada == codigoEntrada);
    _guardarEntradas();
    notifyListeners();
  }

  void actualizarEntrada(Entrada entradaActualizada) {
    final index = _entradas.indexWhere((entrada) => entrada.codigoEntrada == entradaActualizada.codigoEntrada);
    if (index != -1) {
      _entradas[index] = entradaActualizada;
      _guardarEntradas();
      notifyListeners();
    }
  }

  Future<List<Entrada>> obtenerEntradas() async {
    await _cargarEntradas();
    return _entradas;
  }
}
