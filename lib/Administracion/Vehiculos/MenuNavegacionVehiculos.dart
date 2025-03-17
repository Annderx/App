import 'package:flutter/material.dart';
import 'Vehiculos.dart';
import 'InformeVehiculos.dart';

class MenuNavegacionVehiculos extends StatelessWidget {
  const MenuNavegacionVehiculos({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vehículos App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const VehiculosHomePage(),
    );
  }
}

class VehiculosHomePage extends StatefulWidget {
  const VehiculosHomePage({super.key});

  @override
  _VehiculosHomePageState createState() => _VehiculosHomePageState();
}

class _VehiculosHomePageState extends State<VehiculosHomePage> {
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
          const RegistroVehiculos(),
          const InformeVehiculos(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
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