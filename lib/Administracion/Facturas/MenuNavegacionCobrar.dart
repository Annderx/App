import 'package:flutter/material.dart';
import 'FacCobrar.dart';
import 'InformeCobrarFacturas.dart';

class MenuNavegacionCobrarFacturas extends StatelessWidget {
  const MenuNavegacionCobrarFacturas({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Facturas a Cobrar App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: <Widget>[
          const RegistroCobrarFacturas(),
          const InformeCobrarFacturas(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on),
            label: 'Cobrar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Informe',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}