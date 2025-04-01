import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';

class PruebaBD extends StatefulWidget {
  const PruebaBD({super.key});

  @override
  _PruebaBDState createState() => _PruebaBDState();
}

class _PruebaBDState extends State<PruebaBD> {
  String mensaje = "Presiona el botón para probar la conexión";

  Future<void> probarConexion() async {
    try {
      // Configuración de la base de datos
      final settings = ConnectionSettings(
        host: '127.0.0.1',  // Cambia por la IP del servidor MySQL
        port: 3306,
        user: 'root',
        password: '',
        db: 'gastuloautomotriz',
      );

      // Conexión a la base de datos
      final conn = await MySqlConnection.connect(settings);
      setState(() {
        mensaje = "Conectado a la base de datos exitosamente!";
      });

      await conn.close();
    } catch (e) {
      setState(() {
        mensaje = "Error en la conexión: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Prueba de Conexión a MySQL")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(mensaje, textAlign: TextAlign.center),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: probarConexion,
              child: Text("Probar Conexión"),
            ),
          ],
        ),
      ),
    );
  }
}
