import 'package:flutter/material.dart';
import 'Cliente.dart';
import 'InformeClientes.dart';

class NavegacionClientes extends StatelessWidget {
  const NavegacionClientes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clientes App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const RegistroCliente(),
    const InformeClientes(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.person_add),
                  selectedIcon: Icon(Icons.person_add, color: Colors.blue),
                  label: Text('Clientes'),
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
                  icon: Icon(Icons.person_add),
                  label: 'Clientes',
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
