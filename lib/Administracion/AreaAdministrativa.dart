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

class Areaadministrativa extends StatelessWidget {
  const Areaadministrativa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gestion Administrativa')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0), // Padding general
        child: Center(
          // Centrar el contenido horizontalmente
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Centrar verticalmente
            children: [
              _buildButton(context, 'Clientes', const NavegacionClientes()),
              const SizedBox(height: 16),
              _buildButton(context, 'Empleados', const NavegacionEmpleados()),
              const SizedBox(height: 16),
              _buildButton(context, 'Usuarios', const MenuNavegacionUsuarios()),
              const SizedBox(height: 16),
              _buildButton(context, 'Vehiculos', const MenuNavegacionVehiculos()),
              const SizedBox(height: 16),
              _buildButton(
                context,
                'Facturas a Pagar',
                const MenuNavegacionPagarFacturas(),
              ),
              const SizedBox(height: 16),
              _buildButton(
                context,
                'Facturas a Cobrar',
                const MenuNavegacionCobrarFacturas(),
              ),
              const SizedBox(height: 16),
              _buildButton(context, 'Productos', const MenuNavegacionProductos()),
              const SizedBox(height: 16),
              _buildButton(context, 'Entrada', const MenuNavegacionEntrada()),
              const SizedBox(height: 16),
              _buildButton(context, 'Salida', const MenuNavegacionSalida()),
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
      width: 250, // Ancho fijo para todos los botones
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
