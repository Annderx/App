// Suggested code may be subject to a license. Learn more: ~LicenseLog:3281009209.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1738169589.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1473374183.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3141381910.
import 'package:myapp/Administracion/Kardex/MenuNavegationKardex.dart';
import 'package:myapp/Administracion/Productos/MenuNavegacionProductos.dart';
import 'package:myapp/Almacen/Cotizacion/MenuNavegacionCotizacion.dart';
import 'package:myapp/Almacen/EntradaSalida/MenuNavegacionAlmacenEntrada.dart';
import 'package:myapp/Almacen/EntradaSalida/MenuNavegacionAlmacenSalida.dart';
import 'package:myapp/Almacen/Liquidacion%20/MenuNavegacionLiquidacion.dart';
import 'package:myapp/Almacen/Prestamos/MenuNavegacion.dart';
import 'package:myapp/Almacen/Proveedores/MenuNavegacionProveedores.dart';
import 'package:flutter/material.dart';

class Areaalmacen extends StatelessWidget {
  const Areaalmacen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestion Almacen'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0), // Padding general
        child: Center( // Centrar el contenido
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centrar verticalmente
            children: [
              _buildButton(context, 'Productos', const MenuNavegacionProductos()),
              const SizedBox(height: 16),
              _buildButton(context, 'Prestamos', const MenunavegacionPrestamos()),
              const SizedBox(height: 16),
              _buildButton(context, 'Cotizacion', const Menunavegacioncotizacion()),
              const SizedBox(height: 16),
              _buildButton(context, 'Liquidacion', const Menunavegacionliquidacion()),
              const SizedBox(height: 16),
              _buildButton(context, 'Proveedores', const MenunavegacionProveedores()),
              const SizedBox(height: 16),
              _buildButton(context, 'Entrada', const MenunavegacionEntrada()),
              const SizedBox(height: 16),
              _buildButton(context, 'Salida', const MenunavegacionSalida()),
              const SizedBox(height: 16),
              _buildButton(context, 'Kardex', const MenuNavegacionKardex()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text, Widget destination) {
    return SizedBox(
      width: 250, // Ancho fijo para todos los botones (ajusta según necesites)
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destination),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          textStyle: const TextStyle(fontSize: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0), // Bordes redondeados
          ),
        ),
        child: Text(text),
      ),
    );
  }
}