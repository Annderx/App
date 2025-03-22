import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Liquidacion.dart';
import 'InformeLiquidacion.dart';
import 'liquidacion_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => LiquidacionProviderAlmacen(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Liquidaciones App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Menunavegacionliquidacion(),
    );
  }
}

class Menunavegacionliquidacion extends StatefulWidget {
  const Menunavegacionliquidacion({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Menunavegacionliquidacion> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    RegistroLiquidacionProductos(),
    InformeLiquidaciones(),
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
        title: const Text('Liquidaciones'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Registro',
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