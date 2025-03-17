import 'package:flutter/material.dart';
import 'package:myapp/RRHH/Pagos/ClasesPagosSinplanilla.dart';
import 'package:provider/provider.dart';
import 'PagosSinPlanilla_provider.dart';

class InformePagosSinPlanilla extends StatelessWidget {
  const InformePagosSinPlanilla({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PagosSinPlanillaProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Informe de Pagos sin Planilla')),
      body: ListView.builder(
        itemCount: provider.pagos.length,
        itemBuilder: (context, index) {
          PagoSinPlanilla pago = provider.pagos[index];
          return ListTile(
            title: Text('Pago a ${pago.colaborador}'),
            subtitle: Text('Fecha: ${pago.fecha.toString().split(' ')[0]}'),
          );
        },
      ),
    );
  }
}