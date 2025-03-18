import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ClasesProductos.dart';
import 'productos_provider.dart';

class RegistroProductos extends StatefulWidget {
  const RegistroProductos({super.key});

  @override
  State<RegistroProductos> createState() => _RegistroProductosState();
}

class _RegistroProductosState extends State<RegistroProductos> {
  final _formKey = GlobalKey<FormState>();

  // Controladores para los campos de texto
  final _codigoProductoController = TextEditingController();
  final _descripcionController = TextEditingController();
  final _marcaController = TextEditingController();
  final _objetivoController = TextEditingController();
  final _cantidadController = TextEditingController();
  final _categoriaController = TextEditingController();
  final _unidadController = TextEditingController();
  final _precioController = TextEditingController();
  final _detalleMedidaController = TextEditingController();
  final _referenciaController = TextEditingController();
  final _ubicacionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _codigoProductoController.text = _generarCodigoProducto();
  }

  String _generarCodigoProducto() {
    return 'PROD-${DateTime.now().millisecondsSinceEpoch}';
  }

  void _limpiarCampos() {
    _descripcionController.clear();
    _marcaController.clear();
    _objetivoController.clear();
    _cantidadController.clear();
    _categoriaController.clear();
    _unidadController.clear();
    _precioController.clear();
    _detalleMedidaController.clear();
    _referenciaController.clear();
    _ubicacionController.clear();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro de Productos')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildTextField(_codigoProductoController, 'Código Producto', Icons.qr_code, enabled: false),
              _buildTextField(_descripcionController, 'Descripción', Icons.description),
              _buildTextField(_marcaController, 'Marca', Icons.branding_watermark),
              _buildTextField(_ubicacionController, 'Ubicación', Icons.location_on),
              _buildTextField(_objetivoController, 'Objetivo', Icons.flag),
              _buildTextField(_cantidadController, 'Cantidad', Icons.format_list_numbered, isNumeric: true),
              _buildTextField(_categoriaController, 'Categoría', Icons.category),
              _buildTextField(_unidadController, 'Unidad', Icons.straighten),
              _buildTextField(_precioController, 'Precio', Icons.attach_money, isNumeric: true),
              _buildTextField(_detalleMedidaController, 'Detalle de Medida', Icons.info_outline),
              _buildTextField(_referenciaController, 'Referencia', Icons.link),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildActionButton('Guardar', Icons.save, Colors.blue, _guardarProducto),
                  _buildActionButton('Limpiar', Icons.clear, Colors.red, _limpiarCampos),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, IconData icon, {bool enabled = true, bool isNumeric = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          icon: Icon(icon),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        enabled: enabled,
        keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor ingrese $label';
          }
          if (isNumeric && double.tryParse(value) == null) {
            return 'Ingrese un número válido';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildActionButton(String text, IconData icon, Color color, VoidCallback onPressed) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  void _guardarProducto() {
    if (_formKey.currentState!.validate()) {
      final producto = Producto(
        id: DateTime.now().millisecondsSinceEpoch,
        codigoProducto: _codigoProductoController.text,
        descripcion: _descripcionController.text,
        marca: _marcaController.text,
        objetivo: _objetivoController.text,
        cantidad: int.parse(_cantidadController.text),
        categoria: _categoriaController.text,
        unidad: _unidadController.text,
        precio: double.parse(_precioController.text),
        detalleMedida: _detalleMedidaController.text,
        referencia: _referenciaController.text,
        ubicacion: _ubicacionController.text,
      );

      Provider.of<ProductoProvider>(context, listen: false).agregarProducto(producto);
      _limpiarCampos();
      _mostrarMensaje('Producto guardado con éxito');
    }
  }

  void _mostrarMensaje(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(mensaje)));
  }
}
