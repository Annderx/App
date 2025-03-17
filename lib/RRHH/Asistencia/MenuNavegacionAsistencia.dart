import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Asistencia.dart';
import 'InformeAsistencia.dart';
import 'asistencia_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AsistenciaProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Control de Asistencia',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Menunavegacionasistencia(),
    );
  }
}

class Menunavegacionasistencia extends StatefulWidget {
  const Menunavegacionasistencia({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Menunavegacionasistencia> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    ControlAsistenciaPersonal(),
    InformeAsistencias(),
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
        title: const Text('Control de Asistencia'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_ind),
            label: 'Asistencia',
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