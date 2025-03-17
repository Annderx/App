import 'package:flutter/material.dart';
import 'ClasesOficina.dart';

class AreaTrabajoProvider with ChangeNotifier {
  final List<AreaTrabajo> _areasTrabajo = [];

  List<AreaTrabajo> get areasTrabajo => _areasTrabajo;

  void agregarAreaTrabajo(AreaTrabajo areaTrabajo) {
    _areasTrabajo.add(areaTrabajo);
    notifyListeners();
  }

  // Puedes agregar métodos para filtrar y buscar áreas de trabajo
}