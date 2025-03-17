import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Salida.dart';
import 'InformeSalida.dart';
import 'salida_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SalidaProviderAlmacen(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Salidas App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MenunavegacionSalida(),
    );
  }
}

class MenunavegacionSalida extends StatefulWidget {
  const MenunavegacionSalida({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MenunavegacionSalida> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    RegistroSalidaProductos(),
    InformeSalidas(),
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
        title: const Text('Salidas'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.output),
            label: 'Salida',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Inf. Salida',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}