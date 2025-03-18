import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cobrar_provider.dart';
import 'FacturasCobrar.dart';
import 'package:intl/intl.dart'; // Para formatear fechas y montos

class InformeCobrarFacturas extends StatelessWidget {
  const InformeCobrarFacturas({super.key});

  @override
  Widget build(BuildContext context) {
    final facturaProvider = Provider.of<FacturaCobrarProvider>(context);
    final facturas = facturaProvider.facturas;
    final currencyFormat = NumberFormat.currency(locale: 'es_PE', symbol: 'S/'); // Formato de moneda

    return Scaffold(
      appBar: AppBar(title: const Text('Informe de Facturas a Cobrar')),
      body: facturas.isEmpty
          ? const Center(child: Text('No hay facturas registradas'))
          : ListView.builder(
              itemCount: facturas.length,
              itemBuilder: (context, index) {
                final factura = facturas[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    title: Text('Factura: ${factura.nroFactura}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Proveedor: ${factura.proveedor}'),
                        Text('Monto: ${currencyFormat.format(factura.monto)}'),
                        Text('Saldo Pendiente: ${currencyFormat.format(factura.saldoPendiente)}'),
                      ],
                    ),
                    trailing: Icon(Icons.info, color: factura.saldoPendiente > 0 ? Colors.red : Colors.green),
                    onTap: () => _mostrarDetallesFactura(context, factura),
                  ),
                );
              },
            ),
    );
  }

  void _mostrarDetallesFactura(BuildContext context, FacturaCobrar factura) {
    final currencyFormat = NumberFormat.currency(locale: 'es_PE', symbol: 'S/'); // Formato de moneda
    final dateFormat = DateFormat('dd/MM/yyyy'); // Formato de fecha

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Detalles de la Factura'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDetailRow('N° Factura', factura.nroFactura),
                _buildDetailRow('Proveedor', factura.proveedor),
                _buildDetailRow('Monto', currencyFormat.format(factura.monto)),
                _buildDetailRow('Forma de Pago', factura.formaPago),
                _buildDetailRow('Fecha', dateFormat.format(factura.fecha)),
                _buildDetailRow('Acuenta 1', currencyFormat.format(factura.acuenta1)),
                _buildDetailRow('Acuenta 2', currencyFormat.format(factura.acuenta2)),
                _buildDetailRow('Acuenta 3', currencyFormat.format(factura.acuenta3)),
                _buildDetailRow('Saldo Pendiente', currencyFormat.format(factura.saldoPendiente)),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cerrar'),
              onPressed: () => Navigator.of(dialogContext).pop(),
            ),
          ],
        );
      },
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text('$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
