import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'liquidacion_provider.dart';

class InformeLiquidaciones extends StatelessWidget {
  const InformeLiquidaciones({super.key});

  @override
  Widget build(BuildContext context) {
    final liquidacionProvider = Provider.of<LiquidacionProviderAlmacen>(context);
    final liquidaciones = liquidacionProvider.liquidaciones;

    return Scaffold(
      appBar: AppBar(title: const Text('Informe de Liquidaciones')),
      body: ListView.builder(
        itemCount: liquidaciones.length,
        itemBuilder: (context, index) {
          final liquidacion = liquidaciones[index];
          return ListTile(
            title: Text('Liquidación: ${liquidacion.codigoLiquidacion}'),
            subtitle: Text(
                'Producto: ${liquidacion.descripcionProducto}, Cantidad: ${liquidacion.cantidadProducto}'),
            trailing: Text(
                'Fecha: ${liquidacion.fechaEntrega.toString().split(' ')[0]}'),
          );
        },
      ),
    );
  }
}