import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp/Taller/Presupuesto/ClasesPresupuesto.dart';
import 'package:provider/provider.dart';
import 'package:myapp/Taller/Presupuesto/presupuesto_provider.dart';

class RegistroPresupuesto extends StatefulWidget {
  const RegistroPresupuesto({super.key});

  @override
  State<RegistroPresupuesto> createState() => _RegistroPresupuestoState();
}

class _RegistroPresupuestoState extends State<RegistroPresupuesto> {
  final _formKey = GlobalKey<FormState>();

  // Controladores para los campos de texto
  final _noPresupuestoController = TextEditingController();
  final _vehiculoController = TextEditingController();
  final _anoFabricacionController = TextEditingController();
  final _modeloController = TextEditingController();
  final _anoModeloController = TextEditingController();
  final _marcaController = TextEditingController();
  final _combustibleController = TextEditingController();
  final _clienteController = TextEditingController();
  final _contactoController = TextEditingController();
  final _kmController = TextEditingController();
  final _placaController = TextEditingController();
  final _precioController = TextEditingController();
  final _unidadController = TextEditingController();
  final _cantidadController = TextEditingController();
  final _tipoController = TextEditingController();
  final _opcionesController = TextEditingController();
  final _repuestosController = TextEditingController();
  final _descripcionController = TextEditingController();
  final _subtotalController = TextEditingController();
  final _igvController = TextEditingController();
  final _totalController = TextEditingController();

  DateTime? _fechaIngreso;

  void _limpiarCampos() {
    _noPresupuestoController.clear();
    _vehiculoController.clear();
    _anoFabricacionController.clear();
    _modeloController.clear();
    _anoModeloController.clear();
    _marcaController.clear();
    _combustibleController.clear();
    _clienteController.clear();
    _contactoController.clear();
    _kmController.clear();
    _placaController.clear();
    _precioController.clear();
    _unidadController.clear();
    _cantidadController.clear();
    _tipoController.clear();
    _opcionesController.clear();
    _repuestosController.clear();
    _descripcionController.clear();
    _subtotalController.clear();
    _igvController.clear();
    _totalController.clear();
    _fechaIngreso = null;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro de Presupuesto')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildCard(
                title: 'Datos Generales',
                children: [
                  _buildTextField(_noPresupuestoController, 'Nº Presupuesto'),
                  _buildTextField(_clienteController, 'Cliente'),
                  _buildTextField(_contactoController, 'Contacto'),
                ],
              ),
              _buildCard(
                title: 'Información del Vehículo',
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
                      Expanded(child: _buildTextField(_combustibleController, 'Combustible')),
                    ],
                  ),
                  _buildTextField(_placaController, 'Placa'),
                ],
              ),
              _buildCard(
                title: 'Detalles del Trabajo',
                children: [
                  Row(
                    children: [
                      Expanded(child: _buildTextField(_kmController, 'Kilometraje (KM)', isNumber: true)),
                      const SizedBox(width: 10),
                      Expanded(child: _buildTextField(_unidadController, 'Unidad')),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: _buildTextField(_cantidadController, 'Cantidad', isNumber: true)),
                      const SizedBox(width: 10),
                      Expanded(child: _buildTextField(_tipoController, 'Tipo')),
                    ],
                  ),
                  _buildTextField(_opcionesController, 'Opciones'),
                  _buildTextField(_repuestosController, 'Repuestos'),
                  _buildTextField(_descripcionController, 'Descripción', maxLines: 3),
                ],
              ),
              _buildCard(
                title: 'Presupuesto y Costos',
                children: [
                  _buildTextField(_precioController, 'Precio', isNumber: true),
                  Row(
                    children: [
                      Expanded(child: _buildTextField(_subtotalController, 'Subtotal', isNumber: true)),
                      const SizedBox(width: 10),
                      Expanded(child: _buildTextField(_igvController, 'IGV', isNumber: true)),
                      const SizedBox(width: 10),
                      Expanded(child: _buildTextField(_totalController, 'Total', isNumber: true)),
                    ],
                  ),
                ],
              ),
              _buildCard(
                title: 'Fecha de Ingreso',
                children: [
                  ListTile(
                    title: Text(
                      _fechaIngreso != null
                          ? 'Fecha: ${DateFormat('dd/MM/yyyy').format(_fechaIngreso!)}'
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
          onPressed: _limpiarCampos,
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          child: const Text('NUEVO', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
