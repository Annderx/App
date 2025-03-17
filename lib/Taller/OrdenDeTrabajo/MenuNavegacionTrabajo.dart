import 'package:flutter/material.dart';
import 'OrdenTrabajo.dart';
import 'ListaOrdenes.dart';
import 'InformeOrdenTrabajo.dart';

class MenuOrdenesTrabajo extends StatelessWidget {
  const MenuOrdenesTrabajo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Órdenes de Trabajo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RegistroOrdenTrabajo()));
              },
              child: const Text('Registrar Orden de Trabajo'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ListaOrdenesTrabajo()));
              },
              child: const Text('Lista de Órdenes de Trabajo'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => InformeOrdenesTrabajo()));
              },
              child: const Text('Informe de Órdenes de Trabajo'),
            ),
          ],
        ),
      ),
    );
  }
}