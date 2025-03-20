import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ClasesSalida.dart';
import 'salida_provider.dart';

class RegistroSalidaProductos extends StatefulWidget {
  const RegistroSalidaProductos({super.key});

  @override
  State<RegistroSalidaProductos> createState() => _RegistroSalidaProductosState();
}

class _RegistroSalidaProductosState extends State<RegistroSalidaProductos> {
  final _formKey = GlobalKey<FormState>();

  // Controladores para los campos de texto
  final _codigoSalidaController = TextEditingController();
  final _codigoProductoController = TextEditingController();
  final _descripcionController = TextEditingController();
  final _marcaController = TextEditingController();
  final _unidadController = TextEditingController();
  final _cantidadController = TextEditingController();
  final _ubicacionController = TextEditingController();
  final _precioController = TextEditingController();
  final _empleadoController = TextEditingController();
  final _placaVehiculoController = TextEditingController();
  final _estadoController = TextEditingController();

  DateTime? _fecha;

  @override
  void dispose() {
    _codigoSalidaController.dispose();
    _codigoProductoController.dispose();
    _descripcionController.dispose();
    _marcaController.dispose();
    _unidadController.dispose();
    _cantidadController.dispose();
    _ubicacionController.dispose();
    _precioController.dispose();
    _empleadoController.dispose();
    _placaVehiculoController.dispose();
    _estadoController.dispose();
    super.dispose();
  }

  void _limpiarCasillas() {
    _codigoSalidaController.clear();
    _codigoProductoController.clear();
    _descripcionController.clear();
    _marcaController.clear();
    _unidadController.clear();
    _cantidadController.clear();
    _ubicacionController.clear();
    _precioController.clear();
    _empleadoController.clear();
    _placaVehiculoController.clear();
    _estadoController.clear();
    setState(() => _fecha = null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro de Salida de Productos')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildRow([
                _buildTextField(_codigoSalidaController, 'Código Salida', enabled: false),
                _buildDatePicker(),
                _buildTextField(_estadoController, 'Estado'),
              ]),
              _buildTextField(_codigoProductoController, 'Código Producto'),
              _buildTextField(_descripcionController, 'Descripción'),
              _buildRow([
                _buildTextField(_marcaController, 'Marca'),
                _buildTextField(_unidadController, 'Unidad'),
              ]),
              _buildRow([
                _buildTextField(_cantidadController, 'Cantidad', keyboardType: TextInputType.number),
                _buildTextField(_ubicacionController, 'Ubicación'),
                _buildTextField(_precioController, 'Precio', keyboardType: TextInputType.number),
              ]),
              _buildTextField(_empleadoController, 'Empleado'),
              _buildTextField(_placaVehiculoController, 'Placa Vehículo'),
              _buildActionButtons(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRow(List<Widget> children) {
    return Row(children: children.map((e) => Expanded(child: e)).toList());
  }

  Widget _buildTextField(TextEditingController controller, String label,
      {bool enabled = true, TextInputType keyboardType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(labelText: label),
        enabled: enabled,
        keyboardType: keyboardType,
      ),
    );
  }

  Widget _buildDatePicker() {
    return Row(
      children: [
        Text(_fecha != null ? 'Fecha: ${_fecha!.toString().split(' ')[0]}' : 'Fecha: '),
        IconButton(
          onPressed: () async {
            final DateTime? picked = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );
            if (picked != null) setState(() => _fecha = picked);
          },
          icon: const Icon(Icons.calendar_today),
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              final salida = SalidaProducto(
                id: DateTime.now().millisecondsSinceEpoch,
                codigoSalida: _codigoSalidaController.text,
                codigoProducto: _codigoProductoController.text,
                descripcion: _descripcionController.text,
                marca: _marcaController.text,
                unidad: _unidadController.text,
                cantidad: int.tryParse(_cantidadController.text) ?? 0,
                ubicacion: _ubicacionController.text,
                precio: double.tryParse(_precioController.text) ?? 0.0,
                empleado: _empleadoController.text,
                placaVehiculo: _placaVehiculoController.text,
                estado: _estadoController.text,
                fecha: _fecha!,
              );

              Provider.of<SalidaProviderAlmacen>(context, listen: false).agregarSalida(salida);
              _limpiarCasillas();
            }
          },
          child: const Text('Guardar'),
        ),
        ElevatedButton(
          onPressed: _limpiarCasillas,
          child: const Text('Limpiar'),
        ),
      ],
    );
  }
}
