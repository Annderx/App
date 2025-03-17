import 'package:flutter/material.dart';
import 'package:myapp/Administracion/EntradaSalida/InformeEntrada.dart';
import 'Entrada.dart';


class MenuNavegacionEntrada extends StatelessWidget {
  const MenuNavegacionEntrada({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Entradas App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const EntradaHomePage(),
    );
  }
}

class EntradaHomePage extends StatefulWidget {
  const EntradaHomePage({super.key});

  @override
  _EntradaHomePageState createState() => _EntradaHomePageState();
}

class _EntradaHomePageState extends State<EntradaHomePage> {
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
          const RegistroEntrada(),
          const InformeEntradas(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: 'Entrada',
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