import 'package:flutter/material.dart';
import 'package:myapp/Taller/Presupuesto/ClasesPresupuesto.dart'; // Asegúrate de que la ruta sea correcta

class PresupuestoProvider with ChangeNotifier {
  List<Presupuesto> _presupuestos = [];

  List<Presupuesto> get presupuestos => _presupuestos;

  void agregarPresupuesto(Presupuesto presupuesto) {
    _presupuestos.add(presupuesto);
    notifyListeners();
  }

  // Opcional: Métodos para actualizar o eliminar presupuestos
  void actualizarPresupuesto(int index, Presupuesto presupuesto) {
    if (index >= 0 && index < _presupuestos.length) {
      _presupuestos[index] = presupuesto;
      notifyListeners();
    }
  }

  void eliminarPresupuesto(int index) {
    if (index >= 0 && index < _presupuestos.length) {
      _presupuestos.removeAt(index);
      notifyListeners();
    }
  }

  // Opcional: Método para cargar presupuestos desde una fuente de datos
  void cargarPresupuestos(List<Presupuesto> presupuestos) {
    _presupuestos = presupuestos;
    notifyListeners();
  }
}