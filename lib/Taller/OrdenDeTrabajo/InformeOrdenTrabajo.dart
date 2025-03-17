import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'orden_provider.dart';
import 'package:intl/intl.dart';

class InformeOrdenesTrabajo extends StatelessWidget {
  const InformeOrdenesTrabajo({super.key});

  @override
  Widget build(BuildContext context) {
    final ordenTrabajoProvider = Provider.of<OrdenTrabajoProvider>(context);
    final ordenesTrabajo = ordenTrabajoProvider.ordenesTrabajo;

    return Scaffold(
      appBar: AppBar(title: const Text('Informe de Órdenes de Trabajo')),
      body: ListView.builder(
        itemCount: ordenesTrabajo.length,
        itemBuilder: (context, index) {
          final orden = ordenesTrabajo[index];
          return ListTile(
            title: Text('Orden Nº ${orden.numeroOrden}'),
            subtitle: Text(
                '${orden.cliente} - ${DateFormat('dd/MM/yyyy').format(orden.fechaIngreso)}'),
            // Agrega más detalles del informe
          );
        },
      ),
    );
  }
}