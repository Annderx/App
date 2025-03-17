import 'package:flutter/material.dart';
import 'ClasesCorizacion.dart';

class CotizacionProvider with ChangeNotifier {
  final List<Cotizacion> _cotizaciones = [];

  List<Cotizacion> get cotizaciones => _cotizaciones;

  void agregarCotizacion(Cotizacion cotizacion) {
    _cotizaciones.add(cotizacion);
    notifyListeners();
  }

  // Puedes agregar métodos para cargar y guardar cotizaciones desde una base de datos o API
}