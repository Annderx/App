import 'package:flutter/material.dart';
import 'package:myapp/RRHH/Asistencia/Asistencia.dart';
import 'package:myapp/RRHH/Asistencia/MenuNavegacionAsistencia.dart';
import 'package:myapp/RRHH/Oficina/MenuNavegacionOficina.dart';
import 'package:myapp/RRHH/Oficina/Oficina.dart';
import 'package:myapp/RRHH/Pagos/MenuNavegacionConplanilla.dart';
import 'package:myapp/RRHH/Pagos/MenuNavegacionSinplanilla.dart';
import 'package:myapp/RRHH/Pagos/PagosSinPlanilla.dart';
import 'package:myapp/RRHH/PartePagos/MenuNavegacionPagos.dart';
import 'package:myapp/RRHH/PartePagos/PartPagos.dart'; // Importación actualizada

class Arearecursoshumanos extends StatelessWidget {
  const Arearecursoshumanos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestion Recursos Humanos'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildButton(context, 'Asistencia', const Menunavegacionasistencia()),
              const SizedBox(height: 16),
              _buildButton(context, 'Oficina', const Menunavegacionoficina()),
              const SizedBox(height: 16),
              _buildButton(context, 'Pagos en Planilla', const MenuNavegacionConPlanilla()),
              const SizedBox(height: 16),
              _buildButton(context, 'Pagos Sin Planilla', const MenuNavegacionSinPlanilla()),
              const SizedBox(height: 16),
              _buildButton(context, 'Parte de Pagos', const Menunavegacionpagos()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text, Widget destination) {
    return SizedBox(
      width: 250,
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
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Text(text),
      ),
    );
  }
}