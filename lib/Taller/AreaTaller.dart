import 'package:flutter/material.dart';
import 'package:myapp/Taller/OrdenDeTrabajo/MenuNavegacionTrabajo.dart';
import 'package:myapp/Taller/Presupuesto/MenuNavegacionPresupuesto.dart';

class AreaTaller extends StatelessWidget {
  const AreaTaller({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestión de Taller'),
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
            _buildCard(context, 'Orden de Trabajo', Icons.build, const MenuOrdenesTrabajo()),
            _buildCard(context, 'Presupuesto', Icons.request_quote, const MenuPresupuesto()),
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
              colors: [Colors.orangeAccent, Colors.deepOrange], // Fondo degradado
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
