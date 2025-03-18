import 'package:flutter/material.dart';
import 'FacCobrar.dart';
import 'InformeCobrarFacturas.dart';

class MenuNavegacionCobrarFacturas extends StatelessWidget {
  const MenuNavegacionCobrarFacturas({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Facturas a Cobrar',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const CobrarFacturasHomePage(),
    );
  }
}

class CobrarFacturasHomePage extends StatefulWidget {
  const CobrarFacturasHomePage({super.key});

  @override
  _CobrarFacturasHomePageState createState() => _CobrarFacturasHomePageState();
}

class _CobrarFacturasHomePageState extends State<CobrarFacturasHomePage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = const [
    RegistroCobrarFacturas(),
    InformeCobrarFacturas(),
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
            icon: Icon(Icons.monetization_on),
            label: 'Cobrar',
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
