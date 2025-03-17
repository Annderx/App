import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Oficina.dart';
import 'InformeOficina.dart';
import 'clases_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AreaTrabajoProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestión de Áreas de Trabajo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Menunavegacionoficina(),
    );
  }
}

class Menunavegacionoficina extends StatefulWidget {
  const Menunavegacionoficina({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Menunavegacionoficina> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    RegistroAreaTrabajo(),
    InformeAreasTrabajo(),
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
        title: const Text('Gestión de Áreas de Trabajo'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Área',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Informe',
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