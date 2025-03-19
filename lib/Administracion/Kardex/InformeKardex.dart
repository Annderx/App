import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:provider/provider.dart';
import 'kardex_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'Kardex.dart';

class InformeKardex extends StatelessWidget {
  const InformeKardex({super.key});

  Future<void> _generarPDF(BuildContext context) async {
    final productoProvider = Provider.of<KardexProvider>(context, listen: false);
    final kardex = productoProvider.generarKardexDesdeFacturas();

    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        margin: const pw.EdgeInsets.all(20),
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                'Informe de Kardex',
                style: pw.TextStyle(fontSize: 22, fontWeight: pw.FontWeight.bold),
              ),
              pw.SizedBox(height: 10),
              pw.Table.fromTextArray(
                headers: ['Producto', 'Tipo', 'Fecha', 'Cantidad'],
                data: kardex.map((producto) => [
                  producto.nombre,
                  producto.tipo,
                  producto.fecha.toString().split(' ')[0],
                  producto.cantidad.toString(),
                ]).toList(),
                border: pw.TableBorder.all(),
                headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                cellAlignment: pw.Alignment.centerLeft,
              ),
            ],
          );
        },
      ),
    );

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Informe de Kardex')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () => _generarPDF(context),
              icon: const Icon(Icons.picture_as_pdf),
              label: const Text('Generar PDF'),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () async {
                final pdf = await _generarVistaPrevia(context);
                await Printing.layoutPdf(onLayout: (_) async => pdf);
              },
              icon: const Icon(Icons.visibility),
              label: const Text('Vista Previa'),
            ),
          ],
        ),
      ),
    );
  }

  Future<Uint8List> _generarVistaPrevia(BuildContext context) async {
    final productoProvider = Provider.of<KardexProvider>(context, listen: false);
    final kardex = productoProvider.generarKardexDesdeFacturas();

    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Column(
          children: [
            pw.Text('Vista Previa del Kardex', style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 10),
            pw.Table.fromTextArray(
              headers: ['Producto', 'Tipo', 'Fecha', 'Cantidad'],
              data: kardex.map((producto) => [
                producto.nombre,
                producto.tipo,
                producto.fecha.toString().split(' ')[0],
                producto.cantidad.toString(),
              ]).toList(),
            ),
          ],
        ),
      ),
    );

    return pdf.save();
  }
}
