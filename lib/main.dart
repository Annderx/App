import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

// Importa tus Providers
import 'Administracion/Clientes/cliente_provider.dart';
import 'Administracion/Empleados/empleado_provider.dart';
import 'Administracion/EntradaSalida/entrada_provider.dart';
import 'Administracion/EntradaSalida/salida_provider.dart';
import 'Administracion/Facturas/cobrar_provider.dart';
import 'Administracion/Facturas/pagar_provider.dart';
import 'Administracion/Kardex/kardex_provider.dart';
import 'Administracion/Productos/productos_provider.dart';
import 'Administracion/Usuarios/usuarios_provider.dart';
import 'Administracion/Vehiculos/vehiculos_provider.dart';

// Importa tus Áreas
import 'Administracion/AreaAdministrativa.dart';
import 'Almacen/AreaAlmacen.dart';
import 'RRHH/AreaRecursosHumanos.dart';
import 'Taller/AreaTaller.dart';
import 'InventarioVehiculos/Vehiculos.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // 🔥 Inicializa Firebase

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ClienteProvider()),
        ChangeNotifierProvider(create: (_) => EmpleadoProvider()),
        ChangeNotifierProvider(create: (_) => EntradaProvider()),
        ChangeNotifierProvider(create: (_) => SalidaProvider()),
        ChangeNotifierProvider(create: (_) => FacturaCobrarProvider()),
        ChangeNotifierProvider(create: (_) => FacturaPagarProvider()),
        ChangeNotifierProvider(create: (_) => KardexProvider()),
        ChangeNotifierProvider(create: (_) => ProductoProvider()),
        ChangeNotifierProvider(create: (_) => UsuarioProvider()),
        ChangeNotifierProvider(create: (_) => VehiculoProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gestión Empresarial',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
      ),
      themeMode: ThemeMode.system,
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Usuario',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                child: const Text('Iniciar Sesión'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Servicios Empresariales')),
      body: GridView.count(
        padding: const EdgeInsets.all(16.0),
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.3,
        children: [
          _buildButton(context, 'Administración', const AreaAdministrativa(), Icons.settings),
          _buildButton(context, 'Almacén', const AreaAlmacen(), Icons.warehouse),
          _buildButton(context, 'Recursos Humanos', const AreaRecursosHumanos(), Icons.person),
          _buildButton(context, 'Taller', const AreaTaller(), Icons.build),
          _buildButton(context, 'Inventario Vehicular', const InventarioVehicular(), Icons.directions_car),
          _buildButton(context, 'Probar base de datos', const PruebaBD(), Icons.search),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text, Widget destination, IconData icon) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destination),
        );
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40),
          const SizedBox(height: 8),
          Text(text, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

class PruebaBD extends StatelessWidget {
  const PruebaBD({super.key});

  @override
  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance;

    return Scaffold(
      appBar: AppBar(title: const Text('Probar BD Firebase')),
      body: Center(
        child: ElevatedButton.icon(
          icon: const Icon(Icons.cloud_upload),
          label: const Text('Enviar prueba a Firestore'),
          onPressed: () async {
            try {
              await db.collection('pruebas').add({
                'mensaje': 'Hola Firebase desde Flutter',
                'timestamp': DateTime.now(),
              });

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('✅ Datos enviados a Firestore')),
              );
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('❌ Error: $e')),
              );
            }
          },
        ),
      ),
    );
  }
}
