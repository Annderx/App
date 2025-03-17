import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "package:myapp/Almacen/EntradaSalida/entrada_provider.dart";

class InformeEntradas extends StatelessWidget {
  const InformeEntradas({super.key});

  @override
  Widget build(BuildContext context) {
    final entradaProvider = Provider.of<EntradaProviderAlmacen>(context);
    final entradas = entradaProvider.entradas;

    return Scaffold(
      appBar: AppBar(title: const Text('Informe de Entradas')),
      body: ListView.builder(
        itemCount: entradas.length,
        itemBuilder: (context, index) {
          final entrada = entradas[index];
          return ListTile(
            title: Text('Entrada: ${entrada.codigoEntrada}'),
            subtitle: Text(
              'Producto: ${entrada.descripcionProducto}, Cantidad: ${entrada.cantidadProducto}',
            ),
            trailing: Text('Fecha: ${entrada.fecha.toString().split(' ')[0]}'),
          );
        },
      ),
    );
  }
}
