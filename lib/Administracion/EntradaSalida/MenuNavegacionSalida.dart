import 'package:flutter/material.dart';
import 'package:myapp/Administracion/EntradaSalida/InformeSalida.dart';
import 'Salida.dart';

class MenuNavegacionSalida extends StatelessWidget {
  const MenuNavegacionSalida({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Salidas App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SalidaHomePage(),
    );
  }
}

class SalidaHomePage extends StatefulWidget {
  const SalidaHomePage({super.key});

  @override
  _SalidaHomePageState createState() => _SalidaHomePageState();
}

class _SalidaHomePageState extends State<SalidaHomePage> {
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
          const RegistroSalida(),
          const InformeSalidas(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.remove_circle),
            label: 'Salida',
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