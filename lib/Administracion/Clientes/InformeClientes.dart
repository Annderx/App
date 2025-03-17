import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';
import 'cliente_provider.dart';
import 'ClasesClientes.dart';
import 'Cliente.dart';
import 'package:sqflite/sqflite.dart';

class InformeClientes extends StatefulWidget {
  const InformeClientes({Key? key}) : super(key: key);

  @override
  State<InformeClientes> createState() => _InformeClientesState();
}

class _InformeClientesState extends State<InformeClientes> {
  late Future<List<Cliente>> _clientesFuture;
  @override
  void initState() {
    super.initState();
    _clientesFuture = _loadClientes();
  }

  Future<List<Cliente>> _loadClientes() async {
    final clienteProvider =
        Provider.of<ClienteProvider>(context, listen: false);
    clienteProvider.initialize();
    return await clienteProvider.leerClientes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informe de Clientes'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              // Navegar a la pantalla de registro de clientes
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const RegistroCliente()),
              ).then((value) => setState(() {}));
            },
            child: const Text('Agregar Cliente'),
          ),
          Expanded(
            child: FutureBuilder<List<Cliente>>(
              future: _clientesFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No hay clientes disponibles'));
                }
                final clientes = snapshot.data!;
                return ListView.builder(
                  itemCount: clientes.length,
                  itemBuilder: (context, index) {
                    final cliente = clientes[index];
                    return ListTile(
                      title: Text(cliente.razonSocial),
                      subtitle: Text(cliente.codigo),
                      onTap: () => _mostrarDetallesCliente(context, cliente),
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
    final _formKey = GlobalKey<FormState>();

    // Controladores de texto
    final _codigoController = TextEditingController(text: cliente.codigo);
    final _razonSocialController =
        TextEditingController(text: cliente.razonSocial);
    final _direccionController =
        TextEditingController(text: cliente.direccion);
    final _rucController = TextEditingController(text: cliente.ruc);
    final _dniController = TextEditingController(text: cliente.dni);
    final Map<String, TextEditingController> _contactoControllers = {
      'Contacto': TextEditingController(text: cliente.contacto),
      'Teléfono': TextEditingController(text: cliente.telefono),
      'Celular': TextEditingController(text: cliente.celular),
      'Correo': TextEditingController(text: cliente.correo),
    };
    String? _tipoCliente = cliente.tipoCliente;
    bool _esRuc = cliente.esRuc;
    String? _tipoContactoSeleccionado = cliente.tipoContacto;
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Detalles del Cliente'),
          content: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: _codigoController,
                    decoration: const InputDecoration(labelText: 'Código'),
                    enabled: false, // Deshabilitado para edición
                  ),
                  TextFormField(
                    controller: _razonSocialController,
                    decoration:
                        const InputDecoration(labelText: 'Razón Social'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ingrese la razón social';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _direccionController,
                    decoration: const InputDecoration(labelText: 'Dirección'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ingrese la dirección';
                      }
                      return null;
                    },
                  ),
                  DropdownButtonFormField<String>(
                    decoration:
                        const InputDecoration(labelText: 'Tipo de Cliente'),
                    value: _tipoCliente,
                    items: const [
                      DropdownMenuItem<String>(
                          value: 'Tipo 1', child: Text('Tipo 1')),
                      DropdownMenuItem<String>(
                          value: 'Tipo 2', child: Text('Tipo 2')),
                    ],
                    onChanged: (value) {
                      _tipoCliente = value;
                    },
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _rucController,
                          decoration: const InputDecoration(labelText: 'RUC'),
                          enabled: _esRuc,
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: _dniController,
                          decoration: const InputDecoration(labelText: 'DNI'),
                          enabled: !_esRuc,
                        ),
                      ),
                    ],
                  ),
                  // Dropdown para seleccionar el tipo de contacto
                  DropdownButtonFormField<String>(
                    decoration:
                        const InputDecoration(labelText: 'Tipo de Contacto'),
                    value: _tipoContactoSeleccionado,
                    items: const [
                      DropdownMenuItem<String>(
                          value: 'Contacto', child: Text('Contacto')),
                      DropdownMenuItem<String>(
                          value: 'Facturación', child: Text('Facturación')),
                      DropdownMenuItem<String>(
                          value: 'Cobranza', child: Text('Cobranza')),
                      DropdownMenuItem<String>(
                          value: 'Operaciones', child: Text('Operaciones')),
                    ],
                    onChanged: (value) {
                      _tipoContactoSeleccionado = value;
                    },
                  ),
                  // Campos de contacto dinámicos
                  if (_tipoContactoSeleccionado != null) ...[
                    TextFormField(
                      controller: _contactoControllers['Contacto'],
                      decoration: const InputDecoration(labelText: 'Contacto'),
                    ),
                    TextFormField(
                      controller: _contactoControllers['Teléfono'],
                      decoration: const InputDecoration(labelText: 'Teléfono'),
                    ),
                    TextFormField(
                      controller: _contactoControllers['Celular'],
                      decoration: const InputDecoration(labelText: 'Celular'),
                    ),
                    TextFormField(
                      controller: _contactoControllers['Correo'],
                      decoration: const InputDecoration(labelText: 'Correo'),
                    ),
                  ],
                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Guardar'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final clienteProvider =
                      Provider.of<ClienteProvider>(context, listen: false);
                  final clienteEditado = Cliente(
                    id: cliente.id,
                    codigo: _codigoController.text,
                    razonSocial: _razonSocialController.text,
                    direccion: _direccionController.text,
                    tipoCliente: _tipoCliente,
                    esRuc: _esRuc,
                    ruc: _rucController.text,
                    dni: _dniController.text,
                    tipoContacto: _tipoContactoSeleccionado,
                    contacto: _contactoControllers['Contacto']!.text,
                    telefono: _contactoControllers['Teléfono']!.text,
                    celular: _contactoControllers['Celular']!.text,
                    correo: _contactoControllers['Correo']!.text,
                  );
                  clienteProvider.actualizarCliente(clienteEditado);

                  Navigator.of(dialogContext).pop();
                  setState(() {});
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Cliente Editado con exito'),
                    ),
                  );
                }
              },
            ),
            TextButton(
              child: const Text('Eliminar'),
              onPressed: () {
                final clienteProvider =
                    Provider.of<ClienteProvider>(context, listen: false);
                clienteProvider.eliminarCliente(cliente.codigo);
                Navigator.of(dialogContext).pop();
                setState(() {});
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Cliente Eliminado con exito'),
                  ),
                );
              },
            ),
            TextButton(
              child: const Text('Imprimir PDF'),
              onPressed: () {
                _imprimirPDF(context, cliente);
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

  Future<void> _imprimirPDF(BuildContext context, Cliente cliente) async {
    final pdf = pw.Document();

    pdf.addPage(pw.Page(build: (pw.Context context) {
      return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text('Detalles del Cliente',
              style:
                  pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold)),
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
}
