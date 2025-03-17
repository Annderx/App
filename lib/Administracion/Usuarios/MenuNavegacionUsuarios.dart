import 'package:flutter/material.dart';
import 'Usuarios.dart';
import 'InformeUsuarios.dart';

class MenuNavegacionUsuarios extends StatelessWidget {
  const MenuNavegacionUsuarios({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Usuarios App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const UsuariosHomePage(),
    );
  }
}

class UsuariosHomePage extends StatefulWidget {
  const UsuariosHomePage({super.key});

  @override
  _UsuariosHomePageState createState() => _UsuariosHomePageState();
}

class _UsuariosHomePageState extends State<UsuariosHomePage> {
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
          const RegistroUsuarios(),
          const InformeUsuarios(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
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
        onTap: _onItemTapped,
      ),
    );
  }
}