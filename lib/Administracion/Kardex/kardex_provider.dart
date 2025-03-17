import 'package:flutter/material.dart';
import 'package:myapp/Administracion/Facturas/FacturasCobrar.dart';
import 'package:myapp/Administracion/Facturas/FacturasPagar.dart';
import 'ClasesKardex.dart';


class KardexProvider with ChangeNotifier {
  final List<Producto> _productos = [];
  final List<FacturaPagar> _facturasPagar = [];
  final List<FacturaCobrar> _facturasCobrar = [];

  List<Producto> get productos => _productos;
  List<FacturaPagar> get facturasPagar => _facturasPagar;
  List<FacturaCobrar> get facturasCobrar => _facturasCobrar;

  void agregarProducto(Producto producto) {
    _productos.add(producto);
    notifyListeners();
  }

  void agregarFacturaPagar(FacturaPagar factura) {
    _facturasPagar.add(factura);
    notifyListeners();
  }

  void agregarFacturaCobrar(FacturaCobrar factura) {
    _facturasCobrar.add(factura);
    notifyListeners();
  }

  List<Producto> buscarPorFecha(DateTime inicio, DateTime fin) {
    return _productos.where((producto) =>
        producto.fecha.isAfter(inicio.subtract(const Duration(days: 1))) &&
        producto.fecha.isBefore(fin.add(const Duration(days: 1)))).toList();
  }

  List<Producto> buscarPorTipo(String tipo) {
    return _productos.where((producto) => producto.tipo == tipo).toList();
  }

  List<Producto> generarKardexDesdeFacturas() {
    List<Producto> kardex = [];

    // Convertir facturas a pagar en productos
    for (var factura in _facturasPagar) {
      kardex.add(Producto(
        id: factura.hashCode, // Usar hashCode para facturas a pagar
        nombre: factura.proveedor,
        tipo: 'Salida',
        fecha: factura.fecha,
        cantidad: factura.monto.toInt(),
      ));
    }

    // Convertir facturas a cobrar en productos
    for (var factura in _facturasCobrar) {
      kardex.add(Producto(
        id: factura.nroFactura.hashCode, // Usar nroFactura.hashCode para facturas a cobrar
        nombre: factura.proveedor, // Usar proveedor
        tipo: 'Entrada',
        fecha: factura.fecha,
        cantidad: factura.monto.toInt(),
      ));
    }

    return kardex;
  }

  // Métodos adicionales para cargar datos desde una API o base de datos
  // ...
}