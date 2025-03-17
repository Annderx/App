import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Prestamos.dart';
import 'InformePrestamos.dart';
import 'prestamos_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PrestamoProviderAlmacen(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestión de Préstamos',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MenunavegacionPrestamos(),
    );
  }
}

class MenunavegacionPrestamos extends StatefulWidget {
  const MenunavegacionPrestamos({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MenunavegacionPrestamos> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    RegistroPrestamosProductos(),
    InformePrestamos(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gestión de Préstamos')),
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_return),
            label: 'Préstamo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Préstamo Informe',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
