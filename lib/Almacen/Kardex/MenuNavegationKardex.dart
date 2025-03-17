import 'package:flutter/material.dart';
import 'package:myapp/Almacen/Kardex/Kardex.dart';
import 'package:provider/provider.dart';
import 'kardex_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => KardexProviderAlmacen(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kardex App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MenunavegacionKardex(),
    );
  }
}

class MenunavegacionKardex extends StatefulWidget {
  const MenunavegacionKardex({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MenunavegacionKardex> {
  int _selectedIndex = 0;

  // Elimina 'const' aquí
  static final List<Widget> _widgetOptions = <Widget>[
    KardexProductos(),
    // Aquí puedes agregar más opciones relacionadas con el Kardex si es necesario
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
        title: const Text('Kardex'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Kardex',
          ),
          // Puedes agregar más ítems aquí si tienes más funcionalidades del Kardex
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}