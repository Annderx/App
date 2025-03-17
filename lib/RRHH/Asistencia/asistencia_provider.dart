import 'package:flutter/material.dart';
import 'ClaseAsistencia.dart';

class AsistenciaProvider with ChangeNotifier {
  final List<Asistencia> _asistencias = [];

  List<Asistencia> get asistencias => _asistencias;

  void agregarAsistencia(Asistencia asistencia) {
    _asistencias.add(asistencia);
    notifyListeners();
  }

  // Puedes agregar métodos para filtrar y buscar asistencias
}