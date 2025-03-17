import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:provider/provider.dart';
import 'kardex_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class InformeKardex extends StatelessWidget {
  const InformeKardex({super.key});

  Future<void> _generarPDF(BuildContext context) async {
    final productoProvider = Provider.of<KardexProvider>(context, listen: false);
    final kardex = productoProvider.generarKardexDesdeFacturas();

    final pdf = pw.Document();
    pdf.addPage(pw.Page(
      build: (pw.Context context) {
        return pw.ListView.builder(
          itemCount: kardex.length,
          itemBuilder: (context, index) {
            final producto = kardex[index];
            return pw.Text(
                '${producto.nombre} - ${producto.tipo} - ${producto.fecha.toString().split(' ')[0]} - Cantidad: ${producto.cantidad}');
          },
        );
      },
    ));

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informe de Kardex'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _generarPDF(context),
          child: const Text('Generar PDF'),
        ),
      ),
    );
  }
}