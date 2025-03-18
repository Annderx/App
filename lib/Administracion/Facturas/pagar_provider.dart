import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'FacturasPagar.dart';

class FacturaPagarProvider with ChangeNotifier {
  final List<FacturaPagar> _facturas = [];

  List<FacturaPagar> get facturas => _facturas;

  /// 🔹 Agregar una nueva factura
  void agregarFactura(FacturaPagar factura) {
    _facturas.add(factura);
    _guardarFacturas();
    notifyListeners();
  }

  /// 🔹 Eliminar una factura por su número
  void eliminarFactura(String nroFactura) {
    _facturas.removeWhere((factura) => factura.nroFactura == nroFactura);
    _guardarFacturas();
    notifyListeners();
  }

  /// 🔹 Actualizar una factura existente
  void actualizarFactura(FacturaPagar facturaActualizada) {
    final index = _facturas.indexWhere((factura) => factura.nroFactura == facturaActualizada.nroFactura);
    if (index != -1) {
      _facturas[index] = facturaActualizada;
      _guardarFacturas();
      notifyListeners();
    }
  }

  /// 🔹 Cargar facturas almacenadas en `SharedPreferences`
  Future<void> cargarFacturas() async {
    final prefs = await SharedPreferences.getInstance();
    final String? data = prefs.getString('facturas_pagar');
    if (data != null) {
      final List<dynamic> jsonList = json.decode(data);
      _facturas.clear();
      _facturas.addAll(jsonList.map((e) => FacturaPagar.fromMap(e)).toList());
      notifyListeners();
    }
  }

  /// 🔹 Guardar facturas en `SharedPreferences`
  Future<void> _guardarFacturas() async {
    final prefs = await SharedPreferences.getInstance();
    final List<Map<String, dynamic>> jsonList = _facturas.map((factura) => factura.toMap()).toList();
    await prefs.setString('facturas_pagar', json.encode(jsonList));
  }
}
