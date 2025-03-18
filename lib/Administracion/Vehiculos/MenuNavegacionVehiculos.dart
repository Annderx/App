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
        useMaterial3: true, // Soporte para Material Design 3
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

  final List<Widget> _pages = [
    const RegistroVehiculos(),
    const InformeVehiculos(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.car_repair),
              label: 'Registro',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt),
              label: 'Informe',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed, // Mantiene los iconos fijos
        ),
      ),
    );
  }
}
