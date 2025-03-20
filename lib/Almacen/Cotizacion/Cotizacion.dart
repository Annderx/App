import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ClasesCorizacion.dart';
import 'cotizacion_provider.dart';

class RegistroCotizacion extends StatefulWidget {
  const RegistroCotizacion({super.key});

  @override
  State<RegistroCotizacion> createState() => _RegistroCotizacionState();
}

class _RegistroCotizacionState extends State<RegistroCotizacion> {
  final _formKey = GlobalKey<FormState>();

  // Controladores para los campos de texto
  final _codCotizacionController = TextEditingController();
  final _clienteController = TextEditingController();
  final _tipoVehiculoController = TextEditingController();
  final _placaController = TextEditingController();
  final _marcaVehiculoController = TextEditingController();
  final _modeloVehiculoController = TextEditingController();
  final _empresaProveedorController = TextEditingController();
  final _rucProveedorController = TextEditingController();
  final _cotProvController = TextEditingController();
  final _proveedorController = TextEditingController();
  final _telefonoProveedorController = TextEditingController();
  final _marcaProductoController = TextEditingController();
  final _medidaProductoController = TextEditingController();
  final _descripcionProductoController = TextEditingController();
  final _precioProductoController = TextEditingController();
  final _cantidadProductoController = TextEditingController();
  final _subtotalController = TextEditingController();
  final _igvController = TextEditingController();
  final _totalController = TextEditingController();

  DateTime? _fecha;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Cotización'),
        centerTitle: true,
        elevation: 2,
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildCard(
                context,
                title: 'Datos Generales',
                children: [
                  _buildTextField(_codCotizacionController, 'Código Cotización', enabled: false),
                  _buildDatePicker(context),
                  _buildTextField(_clienteController, 'Cliente'),
                ],
              ),
              _buildCard(
                context,
                title: 'Datos del Vehículo',
                children: [
                  _buildTwoFields(_tipoVehiculoController, 'Tipo', _placaController, 'Placa'),
                  _buildTwoFields(_marcaVehiculoController, 'Marca', _modeloVehiculoController, 'Modelo'),
                ],
              ),
              _buildCard(
                context,
                title: 'Datos del Proveedor',
                children: [
                  _buildTextField(_empresaProveedorController, 'Empresa'),
                  _buildTextField(_rucProveedorController, 'RUC'),
                  _buildTextField(_cotProvController, 'Cotización Proveedor'),
                  _buildTwoFields(_proveedorController, 'Proveedor', _telefonoProveedorController, 'Teléfono'),
                ],
              ),
              _buildCard(
                context,
                title: 'Datos del Producto',
                children: [
                  _buildTwoFields(_marcaProductoController, 'Marca', _medidaProductoController, 'Medida'),
                  _buildTextField(_descripcionProductoController, 'Descripción'),
                  _buildTwoFields(_precioProductoController, 'Precio', _cantidadProductoController, 'Cantidad'),
                ],
              ),
              _buildCard(
                context,
                title: 'Totales',
                children: [
                  _buildTwoFields(_subtotalController, 'Subtotal', _igvController, 'IGV'),
                  _buildTextField(_totalController, 'Total', isNumber: true),
                ],
              ),
              const SizedBox(height: 20),
              _buildButtons(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Construye una tarjeta con título y contenido
  Widget _buildCard(BuildContext context, {required String title, required List<Widget> children}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 20),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueAccent)),
            const SizedBox(height: 10),
            ...children,
          ],
        ),
      ),
    );
  }

  /// Construye un campo de texto con diseño moderno
  Widget _buildTextField(TextEditingController controller, String label, {bool enabled = true, bool isNumber = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextFormField(
        controller: controller,
        enabled: enabled,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          filled: true,
          fillColor: Colors.grey[100],
        ),
      ),
    );
  }

  /// Construye dos campos de texto en la misma línea
  Widget _buildTwoFields(TextEditingController controller1, String label1, TextEditingController controller2, String label2) {
    return Row(
      children: [
        Expanded(child: _buildTextField(controller1, label1)),
        const SizedBox(width: 10),
        Expanded(child: _buildTextField(controller2, label2)),
      ],
    );
  }

  /// Selector de fecha con botón de calendario
  Widget _buildDatePicker(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: GestureDetector(
        onTap: () async {
          final DateTime? picked = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime.now(),
          );
          if (picked != null) {
            setState(() {
              _fecha = picked;
            });
          }
        },
        child: AbsorbPointer(
          child: TextFormField(
            decoration: InputDecoration(
              labelText: _fecha != null ? 'Fecha: ${_fecha!.toLocal()}'.split(' ')[0] : 'Seleccionar Fecha',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              filled: true,
              fillColor: Colors.grey[100],
              suffixIcon: const Icon(Icons.calendar_today, color: Colors.blueAccent),
            ),
          ),
        ),
      ),
    );
  }

  /// Botones de acción estilizados
  Widget _buildButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton.icon(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Cotización Guardada')));
              _formKey.currentState!.reset();
            }
          },
          icon: const Icon(Icons.save),
          label: const Text('Guardar'),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ],
    );
  }
}
