import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'asistencia_provider.dart';
import 'ClaseAsistencia.dart';

class InformeAsistencias extends StatelessWidget {
  const InformeAsistencias({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AsistenciaProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Informe de Asistencias')),
      body: ListView.builder(
        itemCount: provider.asistencias.length,
        itemBuilder: (context, index) {
          Asistencia asistencia = provider.asistencias[index];
          return ListTile(
            title: Text('Asistencia de ${asistencia.nombreEmpleado}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Fecha: ${asistencia.fecha.toString().split(' ')[0]}'),
                Text('Hora de Entrada: ${asistencia.horaEntrada}'),
                Text('Hora de Salida: ${asistencia.horaSalida}'),
                Text('Notas: ${asistencia.notas}'),
              ],
            ),
          );
        },
      ),
    );
  }
}