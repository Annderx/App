import 'package:flutter/material.dart';
import 'ClasesKardex.dart';

class KardexProviderAlmacen with ChangeNotifier {
  final List<KardexEntry> _kardexEntries = [];

  List<KardexEntry> get kardexEntries => _kardexEntries;

  void agregarEntradaKardex(KardexEntry entry) {
    _kardexEntries.add(entry);
    notifyListeners();
  }

  // Métodos para filtrar por fecha y tipo
  List<KardexEntry> filtrarPorFecha(DateTime fecha) {
    return _kardexEntries
        .where((entry) =>
            entry.fecha.year == fecha.year &&
            entry.fecha.month == fecha.month &&
            entry.fecha.day == fecha.day)
        .toList();
  }

  List<KardexEntry> filtrarPorTipo(String tipo) {
    return _kardexEntries.where((entry) => entry.tipo == tipo).toList();
  }

  // Puedes agregar métodos para cargar y guardar datos desde una base de datos o API
}