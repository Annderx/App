import 'package:flutter/material.dart';
import 'package:myapp/Taller/OrdenDeTrabajo/MenuNavegacionTrabajo.dart';
import 'package:myapp/Taller/OrdenDeTrabajo/OrdenTrabajo.dart';
import 'package:myapp/Taller/Presupuesto/MenuNavegacionPresupuesto.dart';
import 'package:myapp/Taller/Presupuesto/Presupuesto.dart';

class Areataller extends StatelessWidget {
  const Areataller({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestion Taller'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0), // Padding general
        child: Center( // Centrar el contenido horizontalmente
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centrar verticalmente
            children: [
              _buildButton(context, 'Orden Trabajo', MenuOrdenesTrabajo()),
              const SizedBox(height: 16),
              _buildButton(context, 'Presupuesto', const MenuPresupuesto()),
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