import 'package:flutter/material.dart';
import 'FacPagar.dart';
import 'InformePagarFacturas.dart';

class MenuNavegacionPagarFacturas extends StatelessWidget {
  const MenuNavegacionPagarFacturas({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Facturas a Pagar',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const PagarFacturasHomePage(),
    );
  }
}

class PagarFacturasHomePage extends StatefulWidget {
  const PagarFacturasHomePage({super.key});

  @override
  _PagarFacturasHomePageState createState() => _PagarFacturasHomePageState();
}

class _PagarFacturasHomePageState extends State<PagarFacturasHomePage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = const [
    RegistroPagarFacturas(),
    InformePagarFacturas(),
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.money_off),
            label: 'Pagar',
          ),
          NavigationDestination(
            icon: Icon(Icons.list),
            label: 'Informe',
          ),
        ],
      ),
    );
  }
}
