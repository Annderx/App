import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Productos.dart';
import 'InformeProductos.dart';
import 'productos_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ProductoProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestión de Productos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MenunavegacionProductos(),
    );
  }
}

class MenunavegacionProductos extends StatefulWidget {
  const MenunavegacionProductos({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MenunavegacionProductos> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    RegistroProductos(),
    InformeProductos(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestión de Productos'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: 'Producto',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory_2),
            label: 'Producto Informe',
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