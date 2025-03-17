import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'entrada_provider.dart';
import 'ClasesEntrada.dart';

class InformeEntradas extends StatelessWidget {
  const InformeEntradas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final entradaProvider = Provider.of<EntradaProvider>(context);
    final entradas = entradaProvider.entradas;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Informe de Entradas'),
      ),
      body: ListView.builder(
        itemCount: entradas.length,
        itemBuilder: (context, index) {
          final entrada = entradas[index];
          return ListTile(
            title: Text('Entrada: ${entrada.descripcion}'),
            subtitle: Text('Código: ${entrada.codigoEntrada}'),
            onTap: () => _mostrarDetallesEntrada(context, entrada),
          );
        },
      ),
    );
  }

  void _mostrarDetallesEntrada(BuildContext context, Entrada entrada) {
    // Implementa la lógica para mostrar los detalles de la entrada
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Detalles de la Entrada'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Código: ${entrada.codigoEntrada}'),
                Text('Descripción: ${entrada.descripcion}'),
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