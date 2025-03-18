import 'package:flutter/material.dart';
import 'InformeEntrada.dart';
import 'Entrada.dart';

class MenuNavegacionEntrada extends StatelessWidget {
  const MenuNavegacionEntrada({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Entradas App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
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

  final List<Widget> _screens = [
    const RegistroEntrada(),
    const InformeEntradas(),
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
                  icon: Icon(Icons.add_box),
                  selectedIcon: Icon(Icons.add_box, color: Colors.blue),
                  label: Text('Entrada'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.list),
                  selectedIcon: Icon(Icons.list, color: Colors.blue),
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
