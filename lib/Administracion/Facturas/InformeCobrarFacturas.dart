import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cobrar_provider.dart';
import 'FacturasCobrar.dart';

class InformeCobrarFacturas extends StatelessWidget {
  const InformeCobrarFacturas({super.key});

  @override
  Widget build(BuildContext context) {
    final facturaProvider = Provider.of<FacturaCobrarProvider>(context);
    final facturas = facturaProvider.facturas;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Informe de Facturas a Cobrar'),
      ),
      body: ListView.builder(
        itemCount: facturas.length,
        itemBuilder: (context, index) {
          final factura = facturas[index];
          return ListTile(
            title: Text('Factura: ${factura.nroFactura}'),
            subtitle: Text('Proveedor: ${factura.proveedor}'),
            onTap: () => _mostrarDetallesFactura(context, factura),
          );
        },
      ),
    );
  }

  void _mostrarDetallesFactura(BuildContext context, FacturaCobrar factura) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Detalles de la Factura'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('N° Factura: ${factura.nroFactura}'),
                Text('Proveedor: ${factura.proveedor}'),
                Text('Monto: ${factura.monto}'),
                Text('Forma de Pago: ${factura.formaPago}'),
                Text('Fecha: ${factura.fecha.toString().split(' ')[0]}'),
                Text('Acuenta 1: ${factura.acuenta1}'),
                Text('Acuenta 2: ${factura.acuenta2}'),
                Text('Acuenta 3: ${factura.acuenta3}'),
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