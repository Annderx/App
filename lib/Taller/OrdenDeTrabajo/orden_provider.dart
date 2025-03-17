import 'package:flutter/material.dart';
import 'package:myapp/Taller/OrdenDeTrabajo/ClasesOrdenTrabajo.dart';
import 'OrdenTrabajo.dart';

class OrdenTrabajoProvider with ChangeNotifier {
  final List<OrdenTrabajo> _ordenesTrabajo = [];

  List<OrdenTrabajo> get ordenesTrabajo => _ordenesTrabajo;

  void agregarOrdenTrabajo(OrdenTrabajo orden) {
    _ordenesTrabajo.add(orden);
    notifyListeners();
  }

  // Métodos para editar, eliminar y actualizar estados
}