import 'package:flutter/material.dart';
import 'package:myapp/Administracion/Clientes/MenuNavegacion.dart';
import 'package:myapp/Administracion/Empleados/MenuNavegacionEmpleados.dart';
import 'package:myapp/Administracion/EntradaSalida/MenuNavegacionEntrada.dart';
import 'package:myapp/Administracion/EntradaSalida/MenuNavegacionSalida.dart';
import 'package:myapp/Administracion/Facturas/MenuNavegacionCobrar.dart';
import 'package:myapp/Administracion/Facturas/MenuNavegacionPagar.dart';
import 'package:myapp/Administracion/Kardex/MenuNavegationKardex.dart';
import 'package:myapp/Administracion/Productos/MenuNavegacionProductos.dart';
import 'package:myapp/Administracion/Usuarios/MenuNavegacionUsuarios.dart';
import 'package:myapp/Administracion/Vehiculos/MenuNavegacionVehiculos.dart';

class AreaAdministrativa extends StatelessWidget {
  const AreaAdministrativa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestión Administrativa'),
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
            _buildCard(context, 'Clientes', Icons.people, const NavegacionClientes()),
            _buildCard(context, 'Empleados', Icons.work, const NavegacionEmpleados()),
            _buildCard(context, 'Usuarios', Icons.person, const MenuNavegacionUsuarios()),
            _buildCard(context, 'Vehículos', Icons.directions_car, const MenuNavegacionVehiculos()),
            _buildCard(context, 'Facturas a Pagar', Icons.money_off, const MenuNavegacionPagarFacturas()),
            _buildCard(context, 'Facturas a Cobrar', Icons.monetization_on, const MenuNavegacionCobrarFacturas()),
            _buildCard(context, 'Productos', Icons.inventory, const MenuNavegacionProductos()),
            _buildCard(context, 'Entrada', Icons.input, const MenuNavegacionEntrada()),
            _buildCard(context, 'Salida', Icons.output, const MenuNavegacionSalida()),
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
              colors: [Colors.blueAccent, Colors.lightBlue], // Fondo degradado
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
