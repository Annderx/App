import 'package:flutter/material.dart';
import 'Productos.dart';
import 'InformeProductos.dart';

class MenuNavegacionProductos extends StatelessWidget {
  const MenuNavegacionProductos({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Productos App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProductosHomePage(),
    );
  }
}

class ProductosHomePage extends StatefulWidget {
  const ProductosHomePage({super.key});

  @override
  _ProductosHomePageState createState() => _ProductosHomePageState();
}

class _ProductosHomePageState extends State<ProductosHomePage> {
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
          const RegistroProductos(),
          const InformeProductos(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
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