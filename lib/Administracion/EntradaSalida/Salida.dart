import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ClasesSalida.dart';
import 'InformeSalida.dart';
import 'salida_provider.dart';

class RegistroSalida extends StatefulWidget {
  const RegistroSalida({super.key});

  @override
  State<RegistroSalida> createState() => _RegistroSalidaState();
}

class _RegistroSalidaState extends State<RegistroSalida> {
  final _formKey = GlobalKey<FormState>();

  final _codigoSalidaController = TextEditingController();
  final _codigoProductoController = TextEditingController();
  final _descripcionController = TextEditingController();
  final _cantidadController = TextEditingController();
  final _precioController = TextEditingController();
  final _marcaController = TextEditingController();
  final _unidadController = TextEditingController();
  final _empleadoController = TextEditingController();
  final _clienteController = TextEditingController();
  final _ubicacionController = TextEditingController();

  DateTime? _fecha;
  String? _estado;

  @override
  void initState() {
    super.initState();
    _generarCodigoSalida();
  }

  Future<void> _generarCodigoSalida() async {
    _codigoSalidaController.text = 'SAL-${DateTime.now().millisecondsSinceEpoch}';
  }

  void _limpiarCasillas() {
    _codigoSalidaController.clear();
    _codigoProductoController.clear();
    _descripcionController.clear();
    _cantidadController.clear();
    _precioController.clear();
    _marcaController.clear();
    _unidadController.clear();
    _empleadoController.clear();
    _clienteController.clear();
    _ubicacionController.clear();
    _fecha = null;
    _estado = null;
    setState(() {});
  }

  void _guardarSalida() {
    if (!_formKey.currentState!.validate()) return;

    final salidaProvider = Provider.of<SalidaProvider>(context, listen: false);

    final nuevaSalida = Salida(
      codigoSalida: _codigoSalidaController.text,
      fecha: _fecha,
      codigoProducto: _codigoProductoController.text,
      descripcion: _descripcionController.text,
      cantidad: int.parse(_cantidadController.text),
      precio: double.parse(_precioController.text),
      marca: _marcaController.text,
      unidad: _unidadController.text,
      empleado: _empleadoController.text,
      cliente: _clienteController.text,
      ubicacion: _ubicacionController.text,
      estado: _estado!,
    );

    salidaProvider.agregarSalida(nuevaSalida);

    _mostrarDialogoConfirmacion();
  }

  void _mostrarDialogoConfirmacion() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Salida guardada'),
        content: const Text('¿Desea ver el informe de salidas?'),
        actions: [
          TextButton(
            child: const Text('No'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: const Text('Sí'),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const InformeSalidas()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {bool isNumeric = false}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: label),
      keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
      validator: (value) {
        if (value == null || value.isEmpty) return 'Ingrese $label';
        if (isNumeric && double.tryParse(value) == null) return 'Ingrese un número válido';
        return null;
      },
    );
  }

  Widget _buildFechaSelector() {
    return Row(
      children: [
        Text(
          _fecha != null ? 'Fecha: ${_fecha!.toLocal().toString().split(' ')[0]}' : 'Fecha:',
        ),
        IconButton(
          onPressed: () async {
            final DateTime? picked = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );
            if (picked != null && picked != _fecha) {
              setState(() => _fecha = picked);
            }
          },
          icon: const Icon(Icons.calendar_today),
        ),
      ],
    );
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField('Código Salida', _codigoSalidaController),
              _buildFechaSelector(),
              _buildTextField('Código Producto', _codigoProductoController),
              _buildTextField('Descripción', _descripcionController),
              _buildTextField('Cantidad', _cantidadController, isNumeric: true),
              _buildTextField('Precio', _precioController, isNumeric: true),
              _buildTextField('Marca', _marcaController),
              _buildTextField('Unidad', _unidadController),
              _buildTextField('Empleado', _empleadoController),
              _buildTextField('Cliente', _clienteController),
              _buildTextField('Ubicación', _ubicacionController),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Estado'),
                value: _estado,
                items: ['Disponible', 'No Disponible']
                    .map((estado) => DropdownMenuItem<String>(
                          value: estado,
                          child: Text(estado),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() => _estado = value);
                },
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 10,
                children: [
                  ElevatedButton(onPressed: _guardarSalida, child: const Text('Guardar')),
                  ElevatedButton(onPressed: _limpiarCasillas, child: const Text('Limpiar')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
