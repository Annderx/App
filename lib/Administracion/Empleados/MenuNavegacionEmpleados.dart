import 'package:flutter/material.dart';
import 'Empleados.dart';
import 'InformeEmpleados.dart';

void main() {
  runApp(const NavegacionEmpleados());
}

class NavegacionEmpleados extends StatelessWidget {
  const NavegacionEmpleados({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Empleados App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: <Widget>[
          RegistroEmpleado(), // No necesitas pasar la lista aquí
          const InformeEmpleados(), // No necesitas pasar la lista aquí
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add),
            label: 'Empleados',
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