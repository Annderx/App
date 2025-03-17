import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myapp/Taller/Presupuesto/presupuesto_provider.dart';
import 'package:myapp/Taller/Presupuesto/ClasesPresupuesto.dart';

class ListaPresupuestos extends StatelessWidget {
  const ListaPresupuestos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Presupuestos')),
      body: Consumer<PresupuestoProvider>(
        builder: (context, presupuestoProvider, child) {
          return ListView.builder(
            itemCount: presupuestoProvider.presupuestos.length,
            itemBuilder: (context, index) {
              Presupuesto presupuesto = presupuestoProvider.presupuestos[index];
              return ListTile(
                title: Text('Presupuesto Nº ${presupuesto.noPresupuesto}'),
                subtitle: Text('Vehículo: ${presupuesto.vehiculo}'),
                // Agrega más detalles del presupuesto aquí
              );
            },
          );
        },
      ),
    );
  }
}