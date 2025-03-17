import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'salida_provider.dart';

class InformeSalidas extends StatelessWidget {
  const InformeSalidas({super.key});

  @override
  Widget build(BuildContext context) {
    final salidaProvider = Provider.of<SalidaProviderAlmacen>(context);
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
            title: Text('Salida: ${salida.codigoSalida}'),
            subtitle: Text('Producto: ${salida.descripcion}, Cantidad: ${salida.cantidad}'),
            trailing: Text('Fecha: ${salida.fecha.toString().split(' ')[0]}'),
          );
        },
      ),
    );
  }
}