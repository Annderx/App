import 'package:flutter/material.dart';
import 'package:myapp/Administracion/EntradaSalida/entrada_provider.dart';
import 'package:provider/provider.dart';
import 'Entrada.dart';
import 'InformeEntrada.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => EntradaProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Entradas App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MenunavegacionEntrada(),
    );
  }
}

class MenunavegacionEntrada extends StatefulWidget {
  const MenunavegacionEntrada({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MenunavegacionEntrada> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    RegistroEntradaProductos(),
    InformeEntradas(),
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
        title: const Text('Entradas'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.input),
            label: 'Entrada',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Inf. Entrada',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}