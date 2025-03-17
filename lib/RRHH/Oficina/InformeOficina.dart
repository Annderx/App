import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'clases_provider.dart';
import 'ClasesOficina.dart';

class InformeAreasTrabajo extends StatelessWidget {
  const InformeAreasTrabajo({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AreaTrabajoProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Informe de Áreas de Trabajo')),
      body: ListView.builder(
        itemCount: provider.areasTrabajo.length,
        itemBuilder: (context, index) {
          AreaTrabajo areaTrabajo = provider.areasTrabajo[index];
          return ListTile(
            title: Text('Área de Trabajo ${areaTrabajo.nombre}'),
            subtitle: Text('Código: ${areaTrabajo.codigoArea}'),
          );
        },
      ),
    );
  }
}