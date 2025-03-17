import 'package:flutter/material.dart';
import 'package:myapp/Almacen/Proveedores/proveedores_provider.dart';
import 'package:provider/provider.dart';
import 'Proveedores.dart';
import 'InformeProveedores.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ProveedorProviderAlmacen(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestión de Proveedores',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MenunavegacionProveedores(),
    );
  }
}

class MenunavegacionProveedores extends StatefulWidget {
  const MenunavegacionProveedores({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MenunavegacionProveedores> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    RegistroProveedores(),
    InformeProveedores(),
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
        title: const Text('Gestión de Proveedores'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Proveedor',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Proveedor Informe',
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