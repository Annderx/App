import 'package:flutter/material.dart';
import 'package:myapp/Administracion/Facturas/FacPagar.dart';
import 'InformePagarFacturas.dart';

class MenuNavegacionPagarFacturas extends StatelessWidget {
  const MenuNavegacionPagarFacturas({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Facturas a Pagar App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
          const RegistroPagarFacturas(),
          const InformePagarFacturas(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.money_off),
            label: 'Pagar',
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