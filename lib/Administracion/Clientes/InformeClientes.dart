import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';
import 'cliente_provider.dart';
import 'ClasesClientes.dart';
import 'Cliente.dart';

class InformeClientes extends StatefulWidget {
  const InformeClientes({Key? key}) : super(key: key);

  @override
  State<InformeClientes> createState() => _InformeClientesState();
}

class _InformeClientesState extends State<InformeClientes> {
  late Future<List<Cliente>> _clientesFuture;
  String _filtro = "";

  @override
  void initState() {
    super.initState();
    _cargarClientes();
  }

  void _cargarClientes() {
    final clienteProvider = Provider.of<ClienteProvider>(context, listen: false);
    setState(() {
      _clientesFuture = clienteProvider.obtenerClientes();
    });
  }

  void _eliminarCliente(int id) {
    final clienteProvider = Provider.of<ClienteProvider>(context, listen: false);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Eliminar Cliente'),
        content: const Text('¿Está seguro de que desea eliminar este cliente?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              clienteProvider.eliminarCliente(id);
              _cargarClientes();
              Navigator.pop(context);
            },
            child: const Text('Eliminar', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  Future<void> _imprimirPDF(BuildContext context, Cliente cliente) async {
    final pdf = pw.Document();

    pdf.addPage(pw.Page(build: (pw.Context context) {
      return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text('Detalles del Cliente',
              style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold)),
          pw.SizedBox(height: 10),
          pw.Text('Código: ${cliente.codigo}'),
          pw.Text('Razón Social: ${cliente.razonSocial}'),
          pw.Text('Dirección: ${cliente.direccion}'),
          pw.Text('Tipo de Cliente: ${cliente.tipoCliente ?? 'N/A'}'),
          pw.Text(cliente.esRuc ? 'RUC: ${cliente.ruc ?? 'N/A'}' : 'DNI: ${cliente.dni ?? 'N/A'}'),
          pw.Text('Tipo de Contacto: ${cliente.tipoContacto ?? 'N/A'}'),
          pw.Text('Contacto: ${cliente.contacto ?? 'N/A'}'),
          pw.Text('Teléfono: ${cliente.telefono ?? 'N/A'}'),
          pw.Text('Celular: ${cliente.celular ?? 'N/A'}'),
          pw.Text('Correo: ${cliente.correo ?? 'N/A'}'),
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
      appBar: AppBar(title: const Text('Informe de Clientes')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Buscar Cliente',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onChanged: (value) {
                setState(() => _filtro = value.toLowerCase());
              },
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Cliente>>(
              future: _clientesFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Error al cargar clientes'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No hay clientes registrados'));
                }

                final clientesFiltrados = snapshot.data!.where((cliente) {
                  return cliente.razonSocial.toLowerCase().contains(_filtro) ||
                         cliente.codigo.toLowerCase().contains(_filtro);
                }).toList();

                return ListView.builder(
                  itemCount: clientesFiltrados.length,
                  itemBuilder: (context, index) {
                    final cliente = clientesFiltrados[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Text(cliente.razonSocial[0], style: const TextStyle(color: Colors.white)),
                        ),
                        title: Text(cliente.razonSocial),
                        subtitle: Text('Código: ${cliente.codigo}'),
                        trailing: Wrap(
                          spacing: 10,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.picture_as_pdf, color: Colors.green),
                              onPressed: () => _imprimirPDF(context, cliente),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => _eliminarCliente(cliente.id!),
                            ),
                          ],
                        ),
                        onTap: () => _mostrarDetallesCliente(context, cliente),
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

  void _mostrarDetallesCliente(BuildContext context, Cliente cliente) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Detalles de ${cliente.razonSocial}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Código: ${cliente.codigo}'),
            Text('Dirección: ${cliente.direccion}'),
            Text('Tipo de Cliente: ${cliente.tipoCliente ?? 'N/A'}'),
            Text(cliente.esRuc ? 'RUC: ${cliente.ruc ?? 'N/A'}' : 'DNI: ${cliente.dni ?? 'N/A'}'),
            Text('Teléfono: ${cliente.telefono ?? 'N/A'}'),
            Text('Celular: ${cliente.celular ?? 'N/A'}'),
            Text('Correo: ${cliente.correo ?? 'N/A'}'),
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
