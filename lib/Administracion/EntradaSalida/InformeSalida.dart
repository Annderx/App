import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'salida_provider.dart';
import 'ClasesSalida.dart';

class InformeSalidas extends StatelessWidget {
  const InformeSalidas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final salidaProvider = Provider.of<SalidaProvider>(context);
    final salidas = salidaProvider.salidas;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Informe de Salidas'),
      ),
      body: ListView.builder(
        itemCount: salidas.length,
        itemBuilder: (context, index) {
          final salida = salidas[index];
          return ListTile(
            title: Text('Salida: ${salida.descripcion}'),
            subtitle: Text('Código: ${salida.codigoSalida}'),
            onTap: () => _mostrarDetallesSalida(context, salida),
          );
        },
      ),
    );
  }

  void _mostrarDetallesSalida(BuildContext context, Salida salida) {
    // Implementa la lógica para mostrar los detalles de la salida
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Detalles de la Salida'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Código: ${salida.codigoSalida}'),
                Text('Descripción: ${salida.descripcion}'),
                // ... (otros detalles)
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cerrar'),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
          ],
        );
      },
    );
  }
}