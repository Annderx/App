import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'empleado_provider.dart';
import 'ClasesEmpleados.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class InformeEmpleados extends StatefulWidget {
  const InformeEmpleados({Key? key}) : super(key: key);

  @override
  State<InformeEmpleados> createState() => _InformeEmpleadosState();
}

class _InformeEmpleadosState extends State<InformeEmpleados> {
  late Future<List<Empleado>> _empleadosFuture;
  String _filtro = "";

  @override
  void initState() {
    super.initState();
    _cargarEmpleados();
  }

  void _cargarEmpleados() {
    final empleadoProvider = Provider.of<EmpleadoProvider>(context, listen: false);
    setState(() {
      _empleadosFuture = empleadoProvider.obtenerEmpleados();
    });
  }

  void _eliminarEmpleado(int id) {
    final empleadoProvider = Provider.of<EmpleadoProvider>(context, listen: false);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Eliminar Empleado'),
        content: const Text('¿Está seguro de que desea eliminar este empleado?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              empleadoProvider.eliminarEmpleado(id);
              _cargarEmpleados();
              Navigator.pop(context);
            },
            child: const Text('Eliminar', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  Future<void> _imprimirPDF(BuildContext context, Empleado empleado) async {
    final pdf = pw.Document();

    pdf.addPage(pw.Page(build: (pw.Context context) {
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
    }));

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Informe de Empleados')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Buscar Empleado',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onChanged: (value) {
                setState(() => _filtro = value.toLowerCase());
              },
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Empleado>>(
              future: _empleadosFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Error al cargar empleados'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No hay empleados registrados'));
                }

                final empleadosFiltrados = snapshot.data!.where((empleado) {
                  return empleado.nombre.toLowerCase().contains(_filtro) ||
                         empleado.codigo.toLowerCase().contains(_filtro);
                }).toList();

                return ListView.builder(
                  itemCount: empleadosFiltrados.length,
                  itemBuilder: (context, index) {
                    final empleado = empleadosFiltrados[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Text(empleado.nombre[0], style: const TextStyle(color: Colors.white)),
                        ),
                        title: Text(empleado.nombre),
                        subtitle: Text('Código: ${empleado.codigo}'),
                        trailing: Wrap(
                          spacing: 10,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.picture_as_pdf, color: Colors.green),
                              onPressed: () => _imprimirPDF(context, empleado),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => _eliminarEmpleado(empleado.id!),
                            ),
                          ],
                        ),
                        onTap: () => _mostrarDetallesEmpleado(context, empleado),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _mostrarDetallesEmpleado(BuildContext context, Empleado empleado) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Detalles de ${empleado.nombre}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Código: ${empleado.codigo}'),
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
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cerrar'),
          ),
        ],
      ),
    );
  }
}
