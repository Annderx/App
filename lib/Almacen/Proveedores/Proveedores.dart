import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ClasesProveedores.dart';
import 'proveedores_provider.dart';
// Para formatear entradas numéricas

class RegistroProveedores extends StatefulWidget {
  const RegistroProveedores({super.key});

  @override
  State<RegistroProveedores> createState() => _RegistroProveedoresState();
}

class _RegistroProveedoresState extends State<RegistroProveedores> {
  final _formKey = GlobalKey<FormState>();

  // Controladores
  final _codigoProveedorController = TextEditingController();
  final _razonSocialController = TextEditingController();
  final _noIdentificacionController = TextEditingController();
  final _direccionController = TextEditingController();
  final _telefonoController = TextEditingController();
  final _creditoController = TextEditingController();
  final _correoController = TextEditingController();
  final _notasController = TextEditingController();

  // Controladores para contactos
  final _contacto1NombreController = TextEditingController();
  final _contacto1CorreoController = TextEditingController();
  final _contacto1CelularController = TextEditingController();
  final _contacto2NombreController = TextEditingController();
  final _contacto2CorreoController = TextEditingController();
  final _contacto2CelularController = TextEditingController();

  // Variables para dropdown
  String? _metodoPagoSeleccionado;
  String? _categoriaSeleccionada;
  int _cantidadContactos = 1;

  @override
  void dispose() {
    // Liberar memoria de controladores
    _codigoProveedorController.dispose();
    _razonSocialController.dispose();
    _noIdentificacionController.dispose();
    _direccionController.dispose();
    _telefonoController.dispose();
    _creditoController.dispose();
    _correoController.dispose();
    _notasController.dispose();
    _contacto1NombreController.dispose();
    _contacto1CorreoController.dispose();
    _contacto1CelularController.dispose();
    _contacto2NombreController.dispose();
    _contacto2CorreoController.dispose();
    _contacto2CelularController.dispose();
    super.dispose();
  }

  void _limpiarCampos() {
    _codigoProveedorController.clear();
    _razonSocialController.clear();
    _noIdentificacionController.clear();
    _direccionController.clear();
    _telefonoController.clear();
    _creditoController.clear();
    _correoController.clear();
    _notasController.clear();
    _contacto1NombreController.clear();
    _contacto1CorreoController.clear();
    _contacto1CelularController.clear();
    _contacto2NombreController.clear();
    _contacto2CorreoController.clear();
    _contacto2CelularController.clear();
    _metodoPagoSeleccionado = null;
    _categoriaSeleccionada = null;
    _cantidadContactos = 1;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Proveedores'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Código de Proveedor y Razón Social
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _codigoProveedorController,
                        decoration: const InputDecoration(labelText: 'Código Proveedor'),
                        enabled: false,
                      ),
                      TextFormField(
                        controller: _razonSocialController,
                        decoration: const InputDecoration(labelText: 'Razón Social'),
                        validator: (value) => value!.isEmpty ? 'Este campo es obligatorio' : null,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Información General
              ExpansionTile(
                title: const Text('Información General'),
                children: [
                  _buildTextField(_noIdentificacionController, 'Número de Identificación'),
                  _buildTextField(_direccionController, 'Dirección'),
                  _buildTextField(_telefonoController, 'Teléfono'),
                  Row(
                    children: [
                      Expanded(child: _buildNumericField(_creditoController, 'Crédito Disponible')),
                      Expanded(child: _buildEmailField(_correoController, 'Correo Electrónico')),
                    ],
                  ),
                  _buildTextField(_notasController, 'Notas Adicionales'),
                ],
              ),

              const SizedBox(height: 16),

              // Método de Pago y Categoría
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      DropdownButtonFormField<String>(
                        value: _metodoPagoSeleccionado,
                        decoration: const InputDecoration(labelText: 'Método de Pago'),
                        items: ['Transferencia', 'Efectivo', 'Tarjeta']
                            .map((metodo) => DropdownMenuItem(value: metodo, child: Text(metodo)))
                            .toList(),
                        onChanged: (value) => setState(() => _metodoPagoSeleccionado = value),
                      ),
                      DropdownButtonFormField<String>(
                        value: _categoriaSeleccionada,
                        decoration: const InputDecoration(labelText: 'Categoría'),
                        items: ['Electrónica', 'Construcción', 'Papelería']
                            .map((categoria) => DropdownMenuItem(value: categoria, child: Text(categoria)))
                            .toList(),
                        onChanged: (value) => setState(() => _categoriaSeleccionada = value),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Selección de Contactos
              Text(
                'Cantidad de Contactos:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ChoiceChip(
                    label: const Text('1 Contacto'),
                    selected: _cantidadContactos == 1,
                    onSelected: (selected) => setState(() => _cantidadContactos = 1),
                  ),
                  const SizedBox(width: 10),
                  ChoiceChip(
                    label: const Text('2 Contactos'),
                    selected: _cantidadContactos == 2,
                    onSelected: (selected) => setState(() => _cantidadContactos = 2),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Contacto 1
              ExpansionTile(
                title: const Text('Contacto 1'),
                children: [
                  _buildTextField(_contacto1NombreController, 'Nombre'),
                  _buildEmailField(_contacto1CorreoController, 'Correo'),
                  _buildTextField(_contacto1CelularController, 'Celular'),
                ],
              ),

              // Contacto 2 (Solo si se elige)
              if (_cantidadContactos == 2)
                ExpansionTile(
                  title: const Text('Contacto 2'),
                  children: [
                    _buildTextField(_contacto2NombreController, 'Nombre'),
                    _buildEmailField(_contacto2CorreoController, 'Correo'),
                    _buildTextField(_contacto2CelularController, 'Celular'),
                  ],
                ),

              const SizedBox(height: 16),

              // Botones de acción
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    icon: const Icon(Icons.save),
                    label: const Text('Guardar'),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Aquí iría la lógica para guardar
                      }
                    },
                  ),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.clear),
                    label: const Text('Limpiar'),
                    onPressed: _limpiarCampos,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return TextFormField(controller: controller, decoration: InputDecoration(labelText: label));
  }

  Widget _buildNumericField(TextEditingController controller, String label) {
    return TextFormField(controller: controller, keyboardType: TextInputType.number, decoration: InputDecoration(labelText: label));
  }

  Widget _buildEmailField(TextEditingController controller, String label) {
    return TextFormField(controller: controller, keyboardType: TextInputType.emailAddress, decoration: InputDecoration(labelText: label));
  }
}
