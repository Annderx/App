import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RegistroOrdenTrabajo extends StatefulWidget {
  const RegistroOrdenTrabajo({super.key});

  @override
  _RegistroOrdenTrabajoState createState() => _RegistroOrdenTrabajoState();
}

class _RegistroOrdenTrabajoState extends State<RegistroOrdenTrabajo> {
  final _formKey = GlobalKey<FormState>();

  final _noCotController = TextEditingController();
  final _vehiculoController = TextEditingController();
  final _anoFabricacionController = TextEditingController();
  final _modeloController = TextEditingController();
  final _kmController = TextEditingController();
  final _cantidadController = TextEditingController();
  final _horasController = TextEditingController();
  final _anoModeloController = TextEditingController();
  final _marcaController = TextEditingController();
  final _placaController = TextEditingController();
  final _tipoUnidadController = TextEditingController();
  final _clienteController = TextEditingController();
  final _aseguradosController = TextEditingController();
  final _opcionesController = TextEditingController();
  final _descripcionController = TextEditingController();
  final _contactoController = TextEditingController();

  DateTime? _fechaIngreso;
  String? _tecnicoSeleccionado;

  final List<String> _tecnicos = ['Técnico 1', 'Técnico 2', 'Técnico 3'];

  void _limpiarFormulario() {
    _noCotController.clear();
    _vehiculoController.clear();
    _anoFabricacionController.clear();
    _modeloController.clear();
    _kmController.clear();
    _cantidadController.clear();
    _horasController.clear();
    _anoModeloController.clear();
    _marcaController.clear();
    _placaController.clear();
    _tipoUnidadController.clear();
    _clienteController.clear();
    _aseguradosController.clear();
    _opcionesController.clear();
    _descripcionController.clear();
    _contactoController.clear();
    _fechaIngreso = null;
    _tecnicoSeleccionado = null;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro de Orden de Trabajo')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildCard(
                title: 'Información General',
                children: [
                  _buildTextField(_noCotController, 'Nº COT.'),
                  _buildTextField(_clienteController, 'Cliente'),
                ],
              ),
              _buildCard(
                title: 'Datos del Vehículo',
                children: [
                  _buildTextField(_vehiculoController, 'Vehículo'),
                  Row(
                    children: [
                      Expanded(child: _buildTextField(_anoFabricacionController, 'Año Fabricación', isNumber: true)),
                      const SizedBox(width: 10),
                      Expanded(child: _buildTextField(_anoModeloController, 'Año Modelo', isNumber: true)),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: _buildTextField(_marcaController, 'Marca')),
                      const SizedBox(width: 10),
                      Expanded(child: _buildTextField(_modeloController, 'Modelo')),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: _buildTextField(_placaController, 'Placa')),
                      const SizedBox(width: 10),
                      Expanded(child: _buildTextField(_tipoUnidadController, 'Tipo Unidad')),
                    ],
                  ),
                ],
              ),
              _buildCard(
                title: 'Detalles de Trabajo',
                children: [
                  _buildTextField(_kmController, 'Kilometraje (KM)', isNumber: true),
                  Row(
                    children: [
                      Expanded(child: _buildTextField(_cantidadController, 'Cantidad', isNumber: true)),
                      const SizedBox(width: 10),
                      Expanded(child: _buildTextField(_horasController, 'Horas', isNumber: true)),
                    ],
                  ),
                  _buildTextField(_aseguradosController, 'Asegurados'),
                  _buildTextField(_opcionesController, 'Opciones'),
                  _buildTextField(_descripcionController, 'Descripción', maxLines: 3),
                  _buildTextField(_contactoController, 'Contacto'),
                ],
              ),
              _buildCard(
                title: 'Fecha y Técnico',
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          title: Text(
                            _fechaIngreso != null
                                ? 'Fecha Ingreso: ${DateFormat('dd/MM/yyyy').format(_fechaIngreso!)}'
                                : 'Seleccionar Fecha',
                          ),
                          trailing: const Icon(Icons.calendar_today),
                          onTap: () async {
                            final DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime.now(),
                            );
                            if (picked != null) {
                              setState(() {
                                _fechaIngreso = picked;
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  DropdownButtonFormField<String>(
                    value: _tecnicoSeleccionado,
                    items: _tecnicos.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _tecnicoSeleccionado = value;
                      });
                    },
                    decoration: const InputDecoration(labelText: 'Técnico Asignado'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _buildButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, {bool isNumber = false, int maxLines = 1}) {
    return TextFormField(
      controller: controller,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      ),
    );
  }

  Widget _buildCard({required String title, required List<Widget> children}) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ...children.map((child) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: child,
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              // Guardar datos
            }
          },
          child: const Text('GUARDAR'),
        ),
        ElevatedButton(
          onPressed: _limpiarFormulario,
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          child: const Text('NUEVO', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
