import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myapp/RRHH/Pagos/MenuNavegacionConplanilla.dart';
import 'package:myapp/RRHH/Pagos/MenuNavegacionSinplanilla.dart';
import 'pagos_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PagoProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestión de Pagos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Menunavegacionpagos(),
    );
  }
}

class Menunavegacionpagos extends StatelessWidget {
  const Menunavegacionpagos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestión de Pagos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MenuNavegacionConPlanilla(),
                  ),
                );
              },
              child: const Text('Pagos con Planilla'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MenuNavegacionSinPlanilla(),
                  ),
                );
              },
              child: const Text('Pagos sin Planilla'),
            ),
          ],
        ),
      ),
    );
  }
}