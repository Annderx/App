import 'package:flutter/material.dart';
import 'InformeSalida.dart';
import 'Salida.dart';

class MenuNavegacionSalida extends StatelessWidget {
  const MenuNavegacionSalida({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Salidas App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
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

  final List<Widget> _screens = [
    const RegistroSalida(),
    const InformeSalidas(),
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    bool isWideScreen = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      body: Row(
        children: [
          if (isWideScreen)
            NavigationRail(
              selectedIndex: _selectedIndex,
              onDestinationSelected: _onItemTapped,
              labelType: NavigationRailLabelType.all,
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.remove_circle),
                  selectedIcon: Icon(Icons.remove_circle, color: Colors.red),
                  label: Text('Salida'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.list),
                  selectedIcon: Icon(Icons.list, color: Colors.red),
                  label: Text('Informe'),
                ),
              ],
            ),
          Expanded(
            child: IndexedStack(
              index: _selectedIndex,
              children: _screens,
            ),
          ),
        ],
      ),
      bottomNavigationBar: isWideScreen
          ? null
          : BottomNavigationBar(
              items: const [
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
              selectedItemColor: Colors.red,
              onTap: _onItemTapped,
            ),
    );
  }
}
