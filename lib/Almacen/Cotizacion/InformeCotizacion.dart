import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cotizacion_provider.dart';

class InformeCotizaciones extends StatelessWidget {
  const InformeCotizaciones({super.key});

  @override
  Widget build(BuildContext context) {
    final cotizacionProvider = Provider.of<CotizacionProvider>(context);
    final cotizaciones = cotizacionProvider.cotizaciones;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Informe de Cotizaciones'),
      ),
      body: ListView.builder(
        itemCount: cotizaciones.length,
        itemBuilder: (context, index) {
          final cotizacion = cotizaciones[index];
          return ListTile(
            title: Text('Cotización: ${cotizacion.codCotizacion}'),
            subtitle: Text('Cliente: ${cotizacion.cliente}, Total: ${cotizacion.total}'),
            trailing: Text('Fecha: ${cotizacion.fecha.toString().split(' ')[0]}'),
          );
        },
      ),
    );
  }
}