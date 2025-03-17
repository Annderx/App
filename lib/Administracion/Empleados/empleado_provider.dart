import 'package:flutter/material.dart';
import 'ClasesEmpleados.dart'; // Asegúrate de que la ruta sea correcta

class EmpleadoProvider extends ChangeNotifier {
  final List<Empleado> _empleados = [];

  List<Empleado> get empleados => _empleados;

  void agregarEmpleado(Empleado empleado) {
    _empleados.add(empleado);
    notifyListeners();
  }

  // Puedes agregar más métodos para modificar o eliminar empleados si es necesario
}