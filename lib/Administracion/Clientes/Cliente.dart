import 'package:flutter/material.dart';
import 'InformeClientes.dart'; // Importación correcta
import 'package:provider/provider.dart';
import 'cliente_provider.dart';
import 'ClasesClientes.dart';

class RegistroCliente extends StatefulWidget {
  const RegistroCliente({super.key});

  @override
  State<RegistroCliente> createState() => _RegistroClienteState();
}

class _RegistroClienteState extends State<RegistroCliente> {
  final _formKey = GlobalKey<FormState>();

  // Controladores para los campos de texto
  final _codigoController = TextEditingController();
  final _razonSocialController = TextEditingController();
  final _direccionController = TextEditingController();
  final _rucController = TextEditingController();
  final _dniController = TextEditingController();

  // Controladores para los campos de contacto (ahora dentro de un Map)
  final Map<String, TextEditingController> _contactoControllers = {
    'Contacto': TextEditingController(),
    'Teléfono': TextEditingController(),
    'Celular': TextEditingController(),
    'Correo': TextEditingController(),
  };

  String? _tipoCliente;

  bool _esRuc = true; // Variable para controlar si se muestra RUC o DNI

  // Datos de contacto (ahora para un solo tipo a la vez)
  String? _tipoContactoSeleccionado;

  final Map<String, List<String>> _camposPorTipoContacto = {
    'Contacto': ['Contacto', 'Teléfono', 'Celular', 'Correo'],
    'Facturación': ['Contacto', 'Teléfono', 'Correo'],
    'Cobranza': ['Contacto', 'Teléfono', 'Correo'],
    'Operaciones': ['Contacto', 'Teléfono', 'Correo'],
  };


  @override
  void initState() {
    super.initState();
  }

  void _limpiarCasillas() {
    _codigoController.clear();
    _razonSocialController.clear();
    _direccionController.clear();
    _rucController.clear();
    _dniController.clear();
    _contactoControllers.forEach((key, controller) => controller.clear()); // Limpia los campos de contacto
  }

  void _actualizarTipoDocumento(bool esRuc) {
    setState(() {
      _esRuc = esRuc;
      _rucController.text = "";
      _dniController.text = "";
    });
  }

  List<Widget> _generarCamposDeContacto() {
    if (_tipoContactoSeleccionado == null) {
      return []; // No hay tipo seleccionado, no mostrar campos
    }

    final campos = _camposPorTipoContacto[_tipoContactoSeleccionado]!;
    return campos.map((campo) {
      return TextFormField(
        controller: _contactoControllers[campo],
        decoration: InputDecoration(labelText: campo),
      );
    }).toList();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Clientes'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Campos para código, razón social, dirección, tipo de cliente
              TextFormField(
                controller: _codigoController,
                decoration: const InputDecoration(labelText: 'Código'),
                enabled: false, // Deshabilitado para edición
              ),
              TextFormField(
                controller: _razonSocialController,
                decoration: const InputDecoration(labelText: 'Razón Social'),
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
                decoration: const InputDecoration(labelText: 'Tipo de Cliente'),
                value: _tipoCliente,
                items: const [
                  DropdownMenuItem<String>(value: 'Tipo 1', child: Text('Tipo 1')),
                  DropdownMenuItem<String>(value: 'Tipo 2', child: Text('Tipo 2')),
                ],
                onChanged: (value) {
                  setState(() {
                    _tipoCliente = value;
                  });
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
                decoration: const InputDecoration(labelText: 'Tipo de Contacto'),
                value: _tipoContactoSeleccionado,
                items: _camposPorTipoContacto.keys.map((String value) {
                  return DropdownMenuItem<String>(value: value, child: Text(value));
                }).toList(),
                onChanged: (value) {
                  setState(() => _tipoContactoSeleccionado = value);
                },
              ),

              // Campos de contacto dinámicos
              if (_tipoContactoSeleccionado != null) ...[
                TextFormField(
                  controller: _contactoControllers['Contacto'],
                  decoration: const InputDecoration(labelText: 'Contacto')
                ),
              ],

              // Botones Guardar, Limpiar, Activar RUC, Activar DNI
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final clienteProvider = Provider.of<ClienteProvider>(context, listen: false);

                    final nuevoCliente = Cliente(
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

                    clienteProvider.insertarCliente(nuevoCliente); // Llamada correcta

                    // Mostrar un diálogo
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Cliente guardado'),
                          content: const Text('¿Desea ver el informe de clientes?'),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('No'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: const Text('Sí'),
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => InformeClientes(),
                                  ),
                                );
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: const Text('Guardar'),
              ),
              ElevatedButton(
                onPressed: _limpiarCasillas,
                child: const Text('Limpiar'),
              ),
              ElevatedButton(
                onPressed: () => _actualizarTipoDocumento(true),
                child: const Text('Activar RUC'),
              ),
              ElevatedButton(
                onPressed: () => _actualizarTipoDocumento(false),
                child: const Text('Activar DNI'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
