import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Cotizacion.dart';
import 'InformeCotizacion.dart';
import 'cotizacion_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CotizacionProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cotizaciones App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Menunavegacioncotizacion(),
    );
  }
}

class Menunavegacioncotizacion extends StatefulWidget {
  const Menunavegacioncotizacion({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Menunavegacioncotizacion> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    RegistroCotizacion(),
    InformeCotizaciones(),
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
        title: const Text('Cotizaciones'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            label: 'Registrar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
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