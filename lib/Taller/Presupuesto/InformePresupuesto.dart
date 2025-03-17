import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myapp/Taller/Presupuesto/presupuesto_provider.dart';
import 'package:myapp/Taller/Presupuesto/ClasesPresupuesto.dart';
import 'package:intl/intl.dart'; // Agrega esta línea

class InformePresupuesto extends StatelessWidget {
  const InformePresupuesto({super.key});

  @override
  Widget build(BuildContext context) {
    final presupuestoProvider = Provider.of<PresupuestoProvider>(context);
    final presupuestos = presupuestoProvider.presupuestos;
    final totalPresupuestos = presupuestos.length;
    final valorTotal = presupuestos.fold<double>(
        0, (sum, presupuesto) => sum + double.parse(presupuesto.total));
    final promedioValor =
        totalPresupuestos > 0 ? valorTotal / totalPresupuestos : 0;
    final dateFormat = DateFormat('dd/MM/yyyy');

    return Scaffold(
      appBar: AppBar(title: const Text('Informe de Presupuestos')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Fecha: ${DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now())}',
                style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Text('Total de Presupuestos: $totalPresupuestos'),
            Text('Valor Total: ${valorTotal.toStringAsFixed(2)}'),
            Text('Promedio del Valor: ${promedioValor.toStringAsFixed(2)}'),
            const SizedBox(height: 16),
            const Text('Detalle de Presupuestos:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: presupuestos.length,
              itemBuilder: (context, index) {
                final presupuesto = presupuestos[index];
                return ListTile(
                  title: Text('Nº ${presupuesto.noPresupuesto} - ${presupuesto.cliente}'),
                  subtitle: Text(
                      '${dateFormat.format(presupuesto.fechaIngreso!)} - ${presupuesto.vehiculo} - Total: ${presupuesto.total}'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}