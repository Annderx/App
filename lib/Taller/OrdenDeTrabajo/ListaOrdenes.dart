import 'package:flutter/material.dart';
import 'package:myapp/Taller/OrdenDeTrabajo/OrdenTrabajo.dart';
import 'package:provider/provider.dart';
import 'orden_provider.dart';

class ListaOrdenesTrabajo extends StatelessWidget {
  const ListaOrdenesTrabajo({super.key});

  @override
  Widget build(BuildContext context) {
    final ordenTrabajoProvider = Provider.of<OrdenTrabajoProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Órdenes de Trabajo')),
      body: ListView.builder(
        itemCount: ordenTrabajoProvider.ordenesTrabajo.length,
        itemBuilder: (context, index) {
          final orden = ordenTrabajoProvider.ordenesTrabajo[index];
          return ListTile(
            title: Text('Orden Nº ${orden.numeroOrden}'),
            subtitle: Text('${orden.cliente} - ${orden.vehiculo}'),
            // Agrega más detalles y acciones aquí
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RegistroOrdenTrabajo()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}