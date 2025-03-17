import 'package:flutter/material.dart';
import 'package:myapp/Taller/Presupuesto/Presupuesto.dart';
import 'package:myapp/Taller/Presupuesto/ListaPresupuestos.dart'; // Asegúrate de crear esta pantalla

class MenuPresupuesto extends StatelessWidget {
  const MenuPresupuesto({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menú de Presupuesto')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => RegistroPresupuesto()));
              },
              child: const Text('Registrar Presupuesto'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ListaPresupuestos()));
              },
              child: const Text('Lista de Presupuestos'),
            ),
          ],
        ),
      ),
    );
  }
}