import 'package:flutter/material.dart';
import 'Kardex.dart';
import 'InformeKardex.dart';

class MenuNavegacionKardex extends StatelessWidget {
  const MenuNavegacionKardex({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kardex App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const KardexHomePage(),
    );
  }
}

class KardexHomePage extends StatefulWidget {
  const KardexHomePage({super.key});

  @override
  _KardexHomePageState createState() => _KardexHomePageState();
}

class _KardexHomePageState extends State<KardexHomePage> {
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
          const KardexEntradaSalida(),
          const InformeKardex(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: 'Kardex',
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