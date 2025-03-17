import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'InformePagosConplanilla.dart';
import 'PagosPlanilla.dart';
import 'PagosPlanilla_provider.dart';

class MenuNavegacionConPlanilla extends StatelessWidget {
  const MenuNavegacionConPlanilla({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PagosPlanillaProvider(),
      child: MaterialApp(
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Pagos con Planilla'),
              bottom: const TabBar(
                tabs: [
                  Tab(text: 'Registro'),
                  Tab(text: 'Informe'),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                RegistroPagoConPlanilla(),
                InformePagosConPlanilla(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}