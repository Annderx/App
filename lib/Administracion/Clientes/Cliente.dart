import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cliente_provider.dart';
import 'ClasesClientes.dart';
import 'InformeClientes.dart';

class RegistroCliente extends StatefulWidget {
  const RegistroCliente({super.key});

  @override
  State<RegistroCliente> createState() => _RegistroClienteState();
}

class _RegistroClienteState extends State<RegistroCliente> {
  final _formKey = GlobalKey<FormState>();

  // Controladores para los campos de texto
  final TextEditingController _codigoController = TextEditingController();
  final TextEditingController _razonSocialController = TextEditingController();
  final TextEditingController _direccionController = TextEditingController();
  final TextEditingController _rucController = TextEditingController();
  final TextEditingController _dniController = TextEditingController();
  final Map<String, TextEditingController> _contactoControllers = {
    'Contacto': TextEditingController(),
    'Teléfono': TextEditingController(),
    'Celular': TextEditingController(),
    'Correo': TextEditingController(),
  };

  String? _tipoCliente;
  String? _tipoContactoSeleccionado;
  bool _esRuc = true;

  final Map<String, List<String>> _camposPorTipoContacto = {
    'Contacto': ['Contacto', 'Teléfono', 'Celular', 'Correo'],
    'Facturación': ['Contacto', 'Teléfono', 'Correo'],
    'Cobranza': ['Contacto', 'Teléfono', 'Correo'],
    'Operaciones': ['Contacto', 'Teléfono', 'Correo'],
  };

  void _limpiarCasillas() {
    _codigoController.clear();
    _razonSocialController.clear();
    _direccionController.clear();
    _rucController.clear();
    _dniController.clear();
    _contactoControllers.forEach((_, controller) => controller.clear());
  }

  void _actualizarTipoDocumento(bool esRuc) {
    setState(() {
      _esRuc = esRuc;
      _rucController.clear();
      _dniController.clear();
    });
  }

  void _guardarCliente(BuildContext context) {
    if (!_formKey.currentState!.validate()) return;

    final clienteProvider = Provider.of<ClienteProvider>(context, listen: false);

    final nuevoCliente = Cliente(
      codigo: _codigoController.text,
      razonSocial: _razonSocialController.text,
      direccion: _direccionController.text,
      tipoCliente: _tipoCliente,
      esRuc: _esRuc,
      ruc: _esRuc ? _rucController.text : null,
      dni: !_esRuc ? _dniController.text : null,
      tipoContacto: _tipoContactoSeleccionado,
      contacto: _contactoControllers['Contacto']!.text,
      telefono: _contactoControllers['Teléfono']!.text,
      celular: _contactoControllers['Celular']!.text,
      correo: _contactoControllers['Correo']!.text,
    );

    clienteProvider.insertarCliente(nuevoCliente);

    _mostrarDialogoConfirmacion(context);
  }

  void _mostrarDialogoConfirmacion(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cliente guardado'),
        content: const Text('¿Desea ver el informe de clientes?'),
        actions: [
          TextButton(
            child: const Text('No'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: const Text('Sí'),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.push(context, MaterialPageRoute(builder: (context) => const InformeClientes()));
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown(String label, String? value, List<String> items, Function(String?) onChanged) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(labelText: label),
      value: value,
      items: items.map((item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
      onChanged: onChanged,
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {bool enabled = true}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: label),
      validator: (value) => (value == null || value.isEmpty) ? 'Ingrese $label' : null,
      enabled: enabled,
    );
  }

  Widget _buildContactFields() {
    if (_tipoContactoSeleccionado == null) return const SizedBox.shrink();

    return Column(
      children: _camposPorTipoContacto[_tipoContactoSeleccionado]!.map((campo) {
        return _buildTextField(campo, _contactoControllers[campo]!);
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro de Clientes')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField('Código', _codigoController, enabled: false),
              _buildTextField('Razón Social', _razonSocialController),
              _buildTextField('Dirección', _direccionController),
              _buildDropdown('Tipo de Cliente', _tipoCliente, ['Tipo 1', 'Tipo 2'], (value) {
                setState(() => _tipoCliente = value);
              }),
              Row(
                children: [
                  Expanded(child: _buildTextField('RUC', _rucController, enabled: _esRuc)),
                  Expanded(child: _buildTextField('DNI', _dniController, enabled: !_esRuc)),
                ],
              ),
              _buildDropdown('Tipo de Contacto', _tipoContactoSeleccionado, _camposPorTipoContacto.keys.toList(), (value) {
                setState(() => _tipoContactoSeleccionado = value);
              }),
              _buildContactFields(),
              const SizedBox(height: 20),
              Wrap(
                spacing: 10,
                children: [
                  ElevatedButton(onPressed: () => _guardarCliente(context), child: const Text('Guardar')),
                  ElevatedButton(onPressed: _limpiarCasillas, child: const Text('Limpiar')),
                  ElevatedButton(onPressed: () => _actualizarTipoDocumento(true), child: const Text('Activar RUC')),
                  ElevatedButton(onPressed: () => _actualizarTipoDocumento(false), child: const Text('Activar DNI')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
