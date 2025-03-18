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
        useMaterial3: true, // Mejora visual con Material 3
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
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
  final List<Widget> _screens = const [KardexEntradaSalida(), InformeKardex()];

  void _onItemTapped(int index) => setState(() => _selectedIndex = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gestión de Kardex')),
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.inventory), label: 'Kardex'),
          NavigationDestination(icon: Icon(Icons.list), label: 'Informe'),
        ],
      ),
    );
  }
}
