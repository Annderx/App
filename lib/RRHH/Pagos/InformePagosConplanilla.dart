import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'PagosPlanilla_provider.dart';
import 'ClasesPagosConplanilla.dart';

class InformePagosConPlanilla extends StatelessWidget {
  const InformePagosConPlanilla({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PagosPlanillaProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Informe de Pagos con Planilla')),
      body: ListView.builder(
        itemCount: provider.pagos.length,
        itemBuilder: (context, index) {
          PagoPlanilla pago = provider.pagos[index];
          return ListTile(
            title: Text('Pago a ${pago.colaborador}'),
            subtitle: Text('Fecha: ${pago.fecha.toString().split(' ')[0]}'),
          );
        },
      ),
    );
  }
}