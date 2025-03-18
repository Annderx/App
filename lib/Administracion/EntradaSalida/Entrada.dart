import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'entrada_provider.dart';
import 'ClasesEntrada.dart';
import 'InformeEntrada.dart';

class RegistroEntrada extends StatefulWidget {
  const RegistroEntrada({super.key});

  @override
  _RegistroEntradaState createState() => _RegistroEntradaState();
}

class _RegistroEntradaState extends State<RegistroEntrada> {
  final _formKey = GlobalKey<FormState>();

  // Controladores de texto
  final _codigoEntradaController = TextEditingController();
  final _codigoProductoController = TextEditingController();
  final _descripcionController = TextEditingController();
  final _cantidadController = TextEditingController();
  final _precioController = TextEditingController();
  final _marcaController = TextEditingController();
  final _unidadController = TextEditingController();
  final _proveedorController = TextEditingController();

  DateTime? _fecha;

  @override
  void initState() {
    super.initState();
    _generarCodigoEntrada();
  }

  Future<void> _generarCodigoEntrada() async {
    _codigoEntradaController.text = 'ENT-${DateTime.now().millisecondsSinceEpoch}';
  }

  void _limpiarCasillas() {
    _codigoEntradaController.clear();
    _codigoProductoController.clear();
    _descripcionController.clear();
    _cantidadController.clear();
    _precioController.clear();
    _marcaController.clear();
    _unidadController.clear();
    _proveedorController.clear();
    _fecha = null;

    setState(() {});
  }

  void _guardarEntrada() {
    if (!_formKey.currentState!.validate()) return;

    final entradaProvider = Provider.of<EntradaProvider>(context, listen: false);

    final nuevaEntrada = Entrada(
      codigoEntrada: _codigoEntradaController.text,
      fecha: _fecha,
      codigoProducto: _codigoProductoController.text,
      descripcion: _descripcionController.text,
      cantidad: int.parse(_cantidadController.text),
      precio: double.parse(_precioController.text),
      marca: _marcaController.text,
      unidad: _unidadController.text,
      proveedor: _proveedorController.text,
    );

    entradaProvider.agregarEntrada(nuevaEntrada);

    _mostrarDialogoConfirmacion();
  }

  void _mostrarDialogoConfirmacion() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Entrada guardada'),
        content: const Text('¿Desea ver el informe de entradas y salidas?'),
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
                MaterialPageRoute(builder: (context) => const InformeEntradas()),
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
      appBar: AppBar(title: const Text('Registro de Entrada de Productos')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField('Código Entrada', _codigoEntradaController, isNumeric: false),
              _buildFechaSelector(),
              _buildTextField('Código Producto', _codigoProductoController),
              _buildTextField('Descripción', _descripcionController),
              _buildTextField('Cantidad', _cantidadController, isNumeric: true),
              _buildTextField('Precio', _precioController, isNumeric: true),
              _buildTextField('Marca', _marcaController),
              _buildTextField('Unidad', _unidadController),
              _buildTextField('Proveedor', _proveedorController),
              const SizedBox(height: 20),
              Wrap(
                spacing: 10,
                children: [
                  ElevatedButton(onPressed: _guardarEntrada, child: const Text('Guardar')),
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
