import 'package:flutter/material.dart';
import 'Usuarios.dart';
import 'InformeUsuarios.dart';

class MenuNavegacionUsuarios extends StatefulWidget {
  const MenuNavegacionUsuarios({super.key});

  @override
  _MenuNavegacionUsuariosState createState() => _MenuNavegacionUsuariosState();
}

class _MenuNavegacionUsuariosState extends State<MenuNavegacionUsuarios> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [const RegistroUsuarios(), const InformeUsuarios()];
  final List<String> _titles = ['Registro de Usuarios', 'Informe de Usuarios'];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Usuarios App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(_titles[_selectedIndex]),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
        ),
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: _screens[_selectedIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.person_add),
              label: 'Registro',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Informe',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          selectedIconTheme: const IconThemeData(size: 30),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
