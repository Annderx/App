import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ClasesVehiculos.dart';

class VehiculoProvider with ChangeNotifier {
  List<Vehiculo> _vehiculos = [];

  List<Vehiculo> get vehiculos => _vehiculos;

  VehiculoProvider() {
    _cargarVehiculos(); // Carga los vehículos al iniciar
  }

  Future<void> _cargarVehiculos() async {
    final prefs = await SharedPreferences.getInstance();
    final String? vehiculosJson = prefs.getString('vehiculos');

    if (vehiculosJson != null) {
      final List<dynamic> decoded = jsonDecode(vehiculosJson);
      _vehiculos = decoded.map((item) => Vehiculo.fromJson(item)).toList();
      notifyListeners();
    }
  }

  Future<void> _guardarVehiculos() async {
    final prefs = await SharedPreferences.getInstance();
    final String vehiculosJson = jsonEncode(_vehiculos.map((v) => v.toJson()).toList());
    await prefs.setString('vehiculos', vehiculosJson);
  }

  void agregarVehiculo(Vehiculo vehiculo) {
    _vehiculos.add(vehiculo);
    _guardarVehiculos();
    notifyListeners();
  }

  void eliminarVehiculo(String codigoVehiculo) {
    _vehiculos.removeWhere((v) => v.codigoVehiculo == codigoVehiculo);
    _guardarVehiculos();
    notifyListeners();
  }

  void actualizarVehiculo(Vehiculo vehiculoActualizado) {
    final index = _vehiculos.indexWhere((v) => v.codigoVehiculo == vehiculoActualizado.codigoVehiculo);
    if (index != -1) {
      _vehiculos[index] = vehiculoActualizado;
      _guardarVehiculos();
      notifyListeners();
    }
  }
}
