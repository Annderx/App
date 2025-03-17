import 'package:flutter/material.dart';
import 'ClasesVehiculos.dart';

class VehiculoProvider with ChangeNotifier {
  final List<Vehiculo> _vehiculos = [];

  List<Vehiculo> get vehiculos => _vehiculos;

  void agregarVehiculo(Vehiculo vehiculo) {
    _vehiculos.add(vehiculo);
    notifyListeners();
  }

  // Métodos adicionales para cargar datos desde una API o base de datos
  // ...
}