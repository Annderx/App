import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class PruebaBD extends StatefulWidget {
  const PruebaBD({super.key});

  @override
  _PruebaBDState createState() => _PruebaBDState();
}

class _PruebaBDState extends State<PruebaBD> {
  String mensaje = "Presiona el botón para enviar datos a Firebase";
  bool cargando = false;

  Future<void> enviarDatosAFirebase() async {
    setState(() {
      cargando = true;
      mensaje = "Conectando a Firebase...";
    });

    try {
      final databaseRef = FirebaseDatabase.instance.ref();

      // Guarda un dato de prueba
      await databaseRef.child("pruebas").push().set({
        "mensaje": "Hola desde Flutter a Firebase Realtime Database",
        "timestamp": DateTime.now().toIso8601String(),
      });

      setState(() {
        mensaje = "✅ Datos enviados exitosamente a Realtime Database.";
      });
    } catch (e) {
      setState(() {
        mensaje = "❌ Error al enviar datos: $e";
      });
    } finally {
      setState(() {
        cargando = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Prueba Firebase Realtime DB")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              cargando
                  ? const CircularProgressIndicator()
                  : Icon(
                      mensaje.contains("Error") ? Icons.error : Icons.cloud_done,
                      color: mensaje.contains("Error") ? Colors.red : Colors.green,
                      size: 60,
                    ),
              const SizedBox(height: 20),
              Text(
                mensaje,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                icon: const Icon(Icons.cloud_upload),
                label: const Text("Enviar a Firebase"),
                onPressed: cargando ? null : enviarDatosAFirebase,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
