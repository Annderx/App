import 'package:flutter/material.dart';
import 'package:myapp/Administracion/EntradaSalida/entrada_provider.dart';
import 'package:myapp/Administracion/EntradaSalida/entrada_provider.dart' as entradaAlmacen;
import 'package:myapp/Administracion/EntradaSalida/salida_provider.dart';
import 'package:myapp/Administracion/Facturas/cobrar_provider.dart';
import 'package:myapp/Administracion/Kardex/kardex_provider.dart';
import 'package:myapp/Administracion/Productos/productos_provider.dart';
import 'package:myapp/Administracion/Usuarios/usuarios_provider.dart';
import 'package:myapp/Administracion/Vehiculos/vehiculos_provider.dart';
import 'package:myapp/Almacen/Cotizacion/cotizacion_provider.dart';
import 'package:myapp/Almacen/EntradaSalida/entrada_provider.dart' as entradaAlmacen;
import 'package:myapp/Almacen/EntradaSalida/salida_provider.dart' as salidaAlmacen;
import 'package:myapp/Almacen/Kardex/kardex_provider.dart';
import 'package:myapp/Almacen/Liquidacion%20/liquidacion_provider.dart';
import 'package:myapp/Almacen/Prestamos/prestamos_provider.dart';
import 'package:myapp/Almacen/Proveedores/proveedores_provider.dart';
import 'package:myapp/InventarioVehiculos/Vehiculos.dart';
import 'package:provider/provider.dart';
import 'Administracion/Clientes/cliente_provider.dart';
import 'Administracion/Empleados/empleado_provider.dart';
import 'Administracion/AreaAdministrativa.dart';
import 'Administracion/EntradaSalida/entrada_provider.dart';
import 'Almacen/AreaAlmacen.dart';
import 'package:myapp/RRHH/AreaRecursosHumanos.dart';
import 'package:myapp/Administracion/Facturas/pagar_provider.dart';
import 'package:myapp/Taller/AreaTaller.dart';
import 'package:myapp/RRHH/Oficina/clases_provider.dart';
import 'package:myapp/RRHH/Pagos/PagosPlanilla_provider.dart';
import 'package:myapp/RRHH/Pagos/PagosSinPlanilla_provider.dart';
import 'package:myapp/RRHH/PartePagos/pagos_provider.dart';
import 'package:myapp/Taller/OrdenDeTrabajo/orden_provider.dart';

import 'Administracion/Clientes/MenuNavegacion.dart';
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ClienteProvider()),
        ChangeNotifierProvider(create: (context) => EmpleadoProvider()),
        ChangeNotifierProvider(create: (context) => EntradaProvider()),
        ChangeNotifierProvider(create: (context) => SalidaProvider()),
        ChangeNotifierProvider(create: (context) => KardexProvider()),
        ChangeNotifierProvider(create: (context) => ProductoProvider()),
        ChangeNotifierProvider(create: (context) => UsuarioProvider()),
        ChangeNotifierProvider(create: (context) => VehiculoProvider()),
        ChangeNotifierProvider(create: (context) => entradaAlmacen.EntradaProvider()),
        ChangeNotifierProvider(create: (context) => salidaAlmacen.SalidaProviderAlmacen()),
        ChangeNotifierProvider(create: (context) => KardexProviderAlmacen()),
        ChangeNotifierProvider(create: (context) => LiquidacionProviderAlmacen()),
        ChangeNotifierProvider(create: (context) => PrestamoProviderAlmacen()),
        ChangeNotifierProvider(create: (context) => ProveedorProviderAlmacen()),
        ChangeNotifierProvider(create: (context) => CotizacionProvider()),
        ChangeNotifierProvider(create: (context) => OrdenTrabajoProvider()),
        ChangeNotifierProvider(create: (context) => PagoProvider()),
        ChangeNotifierProvider(create: (context) => PagosPlanillaProvider()),
        ChangeNotifierProvider(create: (context) => FacturaCobrarProvider()),
        ChangeNotifierProvider(create: (context) => PagosSinPlanillaProvider()),
        ChangeNotifierProvider(create: (context) => AreaTrabajoProvider()),
        ChangeNotifierProvider(create: (context) => FacturaPagarProvider()),
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
      title: 'Inicio de Secciones',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        primarySwatch: Colors.blue,
        cardColor: const Color.fromRGBO(255, 255, 255, 0.336),
        textTheme: TextTheme(
          headlineSmall: TextStyle(
            color: Colors.white
          ),
          bodyMedium: TextStyle(color: Color.fromARGB(255, 243, 229, 229)),
          titleLarge: TextStyle(
              color: Color.fromARGB(255, 248, 244, 244),
              fontWeight: FontWeight.bold,
              fontSize: 20),
          titleMedium: TextStyle(
              color: Color.fromARGB(255, 245, 233, 233), fontSize: 16),
        ),
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.white,
        ),
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
      appBar: AppBar(
        title: const Text('Login'),
      ),
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
                obscureText: true, // Para ocultar la contraseña
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Navegar al menu principal
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MyHomePage()),
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

class SectionHeader extends StatelessWidget {
  final String title;
  final String? description;

  const SectionHeader({
    super.key,
    required this.title,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16.0),
      color: theme.cardColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.titleLarge,
          ),
          if (description != null)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                description!,
                style: theme.textTheme.titleMedium,
              ),
            ),
        ],
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Servicios Gastulo'), // Corregido aquí
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.5, // Ajusta la relación de aspecto
          children: [
            _buildButton(
                context,
                'Area Administrativa',
                const Areaadministrativa(),
                const Icon(Icons.settings)),
            _buildButton(context, 'Area Almacen', const Areaalmacen(),
                const Icon(Icons.warehouse)),
            _buildButton(context, 'Area Recursos Humanos',
                const Arearecursoshumanos(), const Icon(Icons.person)),
            _buildButton(context, 'Area Taller', const Areataller(),
                const Icon(Icons.build)),
            _buildButton(
                context,
                'Inventarios Vehiculos',
                InventarioVehicular(),
                const Icon(Icons.directions_car)),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text, Widget destination, Icon icon) {
    return Padding(
      padding: const EdgeInsets.all(8.0), // Padding dentro del botón
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destination),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          textStyle: const TextStyle(fontSize: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0), // Bordes redondeados
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Alinea el contenido horizontalmente
          children: [icon, const SizedBox(width: 8), Text(text)], // Icono y texto
        ),
      ),
    );
  }
}
