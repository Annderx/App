import 'package:flutter/material.dart';
import 'package:myapp/Administracion/Facturas/FacturasCobrar.dart';
import 'package:myapp/Administracion/Facturas/FacturasPagar.dart';
import 'ClasesKardex.dart';

class KardexProvider with ChangeNotifier {
  final List<Producto> _productos = [];
  final List<FacturaPagar> _facturasPagar = [];
  final List<FacturaCobrar> _facturasCobrar = [];

  List<Producto> get productos => List.unmodifiable(_productos);
  List<FacturaPagar> get facturasPagar => List.unmodifiable(_facturasPagar);
  List<FacturaCobrar> get facturasCobrar => List.unmodifiable(_facturasCobrar);

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
    return _productos.where((producto) {
      final fecha = producto.fecha;
      return fecha.isAfter(inicio.subtract(const Duration(days: 1))) &&
             fecha.isBefore(fin.add(const Duration(days: 1)));
    }).toList();
  }

  List<Producto> buscarPorTipo(String tipo) {
    return _productos.where((producto) => producto.tipo == tipo).toList();
  }

  List<Producto> generarKardexDesdeFacturas() {
    final List<Producto> kardex = [];

    for (var factura in _facturasPagar) {
      kardex.add(Producto(
        id: factura.hashCode,
        nombre: factura.proveedor,
        tipo: 'Salida',
        fecha: factura.fecha,
        cantidad: factura.monto.toInt(),
      ));
    }

    for (var factura in _facturasCobrar) {
      kardex.add(Producto(
        id: factura.nroFactura.hashCode,
        nombre: factura.proveedor,
        tipo: 'Entrada',
        fecha: factura.fecha,
        cantidad: factura.monto.toInt(),
      ));
    }

    return kardex;
  }
}
