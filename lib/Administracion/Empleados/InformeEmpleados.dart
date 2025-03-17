import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'empleado_provider.dart';
import 'ClasesEmpleados.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class InformeEmpleados extends StatelessWidget {
  const InformeEmpleados({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final empleadoProvider = Provider.of<EmpleadoProvider>(context); // Obtén EmpleadoProvider
    final empleados = empleadoProvider.empleados; // Obtén la lista de empleados

    return Scaffold(
      appBar: AppBar(
        title: const Text('Informe de Empleados'),
      ),
      body: ListView.builder(
        itemCount: empleados.length, // Usa la lista obtenida
        itemBuilder: (context, index) {
          final empleado = empleados[index];
          return ListTile(
            title: Text(empleado.nombre),
            subtitle: Text('Código: ${empleado.codigo}'),
            onTap: () => _mostrarDetallesEmpleado(context, empleado),
          );
        },
      ),
    );
  }

  void _mostrarDetallesEmpleado(BuildContext context, Empleado empleado) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Detalles del Empleado'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ... (detalles del empleado)
                Text('Código: ${empleado.codigo}'),
                Text('Nombre: ${empleado.nombre}'),
                Text('Área: ${empleado.area}'),
                Text('Tipo: ${empleado.tipo}'),
                Text('Función: ${empleado.funcion}'),
                Text('Condición: ${empleado.condicion}'),
                Text('Teléfono: ${empleado.telefono}'),
                Text('DNI: ${empleado.dni}'),
                Text('Dirección: ${empleado.direccion}'),
                Text('Sueldo: ${empleado.sueldo}'),
                Text('Edad: ${empleado.edad}'),
                Text('Fecha de Nacimiento: ${empleado.fechaNacimiento?.toString().split(' ')[0] ?? 'No especificada'}'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Modificar'),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
            TextButton(
              child: const Text('Eliminar'),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
            TextButton(
              child: const Text('Imprimir PDF'),
              onPressed: () {
                _imprimirPDF(context, empleado); // Pass context
                Navigator.of(dialogContext).pop();
              },
            ),
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

  Future<void> _imprimirPDF(BuildContext context, Empleado empleado) async {
    final pdf = pw.Document();

    pdf.addPage(pw.Page(
      build: (pw.Context context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text('Detalles del Empleado', style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 10),
            pw.Text('Código: ${empleado.codigo}'),
            pw.Text('Nombre: ${empleado.nombre}'),
            pw.Text('Área: ${empleado.area}'),
            pw.Text('Tipo: ${empleado.tipo}'),
            pw.Text('Función: ${empleado.funcion}'),
            pw.Text('Condición: ${empleado.condicion}'),
            pw.Text('Teléfono: ${empleado.telefono}'),
            pw.Text('DNI: ${empleado.dni}'),
            pw.Text('Dirección: ${empleado.direccion}'),
            pw.Text('Sueldo: ${empleado.sueldo}'),
            pw.Text('Edad: ${empleado.edad}'),
            pw.Text('Fecha de Nacimiento: ${empleado.fechaNacimiento?.toString().split(' ')[0] ?? 'No especificada'}'),
          ],
        );
      },
    ));

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }
}