import 'package:flutter/material.dart';
import 'package:myapp/RRHH/Asistencia/MenuNavegacionAsistencia.dart';
import 'package:myapp/RRHH/Oficina/MenuNavegacionOficina.dart';
import 'package:myapp/RRHH/Pagos/MenuNavegacionConplanilla.dart';
import 'package:myapp/RRHH/Pagos/MenuNavegacionSinplanilla.dart';
import 'package:myapp/RRHH/PartePagos/MenuNavegacionPagos.dart';

class AreaRecursosHumanos extends StatelessWidget {
  const AreaRecursosHumanos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestión de Recursos Humanos'),
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
            _buildCard(context, 'Asistencia', Icons.check_circle, const Menunavegacionasistencia()),
            _buildCard(context, 'Oficina', Icons.business, const Menunavegacionoficina()),
            _buildCard(context, 'Pagos en Planilla', Icons.attach_money, const MenuNavegacionConPlanilla()),
            _buildCard(context, 'Pagos Sin Planilla', Icons.money_off, const MenuNavegacionSinPlanilla()),
            _buildCard(context, 'Parte de Pagos', Icons.payment, const Menunavegacionpagos()),
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
