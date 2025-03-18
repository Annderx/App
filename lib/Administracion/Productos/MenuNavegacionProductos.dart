import 'package:flutter/material.dart';
import 'Productos.dart';
import 'InformeProductos.dart';

class MenuNavegacionProductos extends StatelessWidget {
  const MenuNavegacionProductos({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestión de Productos',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
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

  final List<Widget> _pages = [
    const RegistroProductos(),
    const InformeProductos(),
  ];

  final List<String> _titles = [
    'Registrar Producto',
    'Informe de Productos',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
        centerTitle: true,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
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
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
