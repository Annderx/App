// informe_pagos_planilla.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pagos_provider.dart';

class InformePagosConPlanilla extends StatelessWidget {
  const InformePagosConPlanilla({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PagoProvider>(context);
    return Scaffold(
      body: ListView.builder(
        itemCount: provider.pagosPlanilla.length,
        itemBuilder: (context, index) {
          final pago = provider.pagosPlanilla[index];
          return ListTile(
            title: Text(pago['colaborador']),
            subtitle: Text('Sueldo neto: ${pago['sueldoNeto']}'),
          );
        },
      ),
    );
  }
}

// informe_pagos_sin_planilla.dart

class InformePagosSinPlanilla extends StatelessWidget {
  const InformePagosSinPlanilla({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PagoProvider>(context);
    return Scaffold(
      body: ListView.builder(
        itemCount: provider.pagosSinPlanilla.length,
        itemBuilder: (context, index) {
          final pago = provider.pagosSinPlanilla[index];
          return ListTile(
            title: Text(pago['colaborador']),
            subtitle: Text('Sueldo neto: ${pago['sueldoNeto']}'),
          );
        },
      ),
    );
  }
}