import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'PagosSinPlanilla.dart';
import 'InformePagosSinplanilla.dart';
import 'PagosSinPlanilla_provider.dart';

class MenuNavegacionSinPlanilla extends StatelessWidget {
  const MenuNavegacionSinPlanilla({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PagosSinPlanillaProvider(),
      child: MaterialApp(
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Pagos sin Planilla'),
              bottom: const TabBar(
                tabs: [Tab(text: 'Registro'), Tab(text: 'Informe')],
              ),
            ),
            body: TabBarView(
              children: [const RegistroPagoSinPlanilla(), InformePagosSinPlanilla()],
            ),
          ),
        ),
      ),
    );
  }
}
