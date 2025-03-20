import 'package:flutter/material.dart';
import 'package:myapp/Administracion/Kardex/MenuNavegationKardex.dart';
import 'package:myapp/Administracion/Productos/MenuNavegacionProductos.dart';
import 'package:myapp/Almacen/Cotizacion/MenuNavegacionCotizacion.dart';
import 'package:myapp/Almacen/EntradaSalida/MenuNavegacionAlmacenEntrada.dart';
import 'package:myapp/Almacen/EntradaSalida/MenuNavegacionAlmacenSalida.dart';
import 'package:myapp/Almacen/Liquidacion%20/MenuNavegacionLiquidacion.dart';
import 'package:myapp/Almacen/Prestamos/MenuNavegacion.dart';
import 'package:myapp/Almacen/Proveedores/MenuNavegacionProveedores.dart';

class AreaAlmacen extends StatelessWidget {
  const AreaAlmacen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestión de Almacén'),
        centerTitle: true,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2, // Dos columnas para mejor distribución
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.3,
          children: [
            _buildCard(context, 'Productos', Icons.inventory, const MenuNavegacionProductos()),
            _buildCard(context, 'Préstamos', Icons.swap_horiz, const MenunavegacionPrestamos()),
            _buildCard(context, 'Cotización', Icons.request_quote, const Menunavegacioncotizacion()),
            _buildCard(context, 'Liquidación', Icons.receipt_long, const Menunavegacionliquidacion()),
            _buildCard(context, 'Proveedores', Icons.store, const MenunavegacionProveedores()),
            _buildCard(context, 'Entrada', Icons.input, const MenunavegacionEntrada()),
            _buildCard(context, 'Salida', Icons.output, const MenunavegacionSalida()),
            _buildCard(context, 'Kardex', Icons.assignment, const MenuNavegacionKardex()),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, String text, IconData icon, Widget destination) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => destination));
      },
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: [Colors.deepPurpleAccent, Colors.blueAccent], // Fondo degradado
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Colors.white),
              const SizedBox(height: 8),
              Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
