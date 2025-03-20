import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ClasesProductos.dart';
import 'productos_provider.dart';
import 'package:flutter/services.dart'; // Para formatear entradas numéricas

class RegistroProductos extends StatefulWidget {
  const RegistroProductos({super.key});

  @override
  State<RegistroProductos> createState() => _RegistroProductosState();
}

class _RegistroProductosState extends State<RegistroProductos> {
  final _formKey = GlobalKey<FormState>();

  // Controladores
  final _codigoProductoController = TextEditingController();
  final _descripcionController = TextEditingController();
  final _marcaController = TextEditingController();
  final _ubicacionController = TextEditingController();
  final _objetivoController = TextEditingController();
  final _cantidadController = TextEditingController();
  final _precioController = TextEditingController();
  final _detalleMedidaController = TextEditingController();

  // Variables para dropdown
  String? _categoriaSeleccionada;
  String? _unidadSeleccionada;

  @override
  void dispose() {
    // Liberar memoria de controladores
    _codigoProductoController.dispose();
    _descripcionController.dispose();
    _marcaController.dispose();
    _ubicacionController.dispose();
    _objetivoController.dispose();
    _cantidadController.dispose();
    _precioController.dispose();
    _detalleMedidaController.dispose();
    super.dispose();
  }

  void _limpiarCampos() {
    _codigoProductoController.clear();
    _descripcionController.clear();
    _marcaController.clear();
    _ubicacionController.clear();
    _objetivoController.clear();
    _cantidadController.clear();
    _precioController.clear();
    _detalleMedidaController.clear();
    _categoriaSeleccionada = null;
    _unidadSeleccionada = null;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Productos'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Código de Producto y Descripción
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _codigoProductoController,
                        decoration: const InputDecoration(labelText: 'Código Producto'),
                        enabled: false,
                      ),
                      TextFormField(
                        controller: _descripcionController,
                        decoration: const InputDecoration(labelText: 'Descripción'),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Información del Producto
              ExpansionTile(
                title: const Text('Detalles del Producto'),
                children: [
                  _buildTextField(_marcaController, 'Marca'),
                  _buildTextField(_ubicacionController, 'Ubicación'),
                  _buildTextField(_objetivoController, 'Objetivo'),
                  Row(
                    children: [
                      Expanded(child: _buildNumericField(_cantidadController, 'Cantidad')),
                      Expanded(child: _buildNumericField(_precioController, 'Precio')),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Selección de Categoría y Unidad
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      DropdownButtonFormField<String>(
                        value: _categoriaSeleccionada,
                        decoration: const InputDecoration(labelText: 'Categoría'),
                        items: ['Electrónica', 'Muebles', 'Accesorios']
                            .map((categoria) => DropdownMenuItem(value: categoria, child: Text(categoria)))
                            .toList(),
                        onChanged: (value) => setState(() => _categoriaSeleccionada = value),
                      ),
                      DropdownButtonFormField<String>(
                        value: _unidadSeleccionada,
                        decoration: const InputDecoration(labelText: 'Unidad'),
                        items: ['Unidad', 'Caja', 'Paquete']
                            .map((unidad) => DropdownMenuItem(value: unidad, child: Text(unidad)))
                            .toList(),
                        onChanged: (value) => setState(() => _unidadSeleccionada = value),
                      ),
                      _buildTextField(_detalleMedidaController, 'Detalle de Medida'),
                    ],
                  ),
                ),
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
                        final producto = Producto(
                          codigoProducto: int.tryParse(_codigoProductoController.text) ?? 0,
                          descripcion: _descripcionController.text,
                          marca: _marcaController.text,
                          ubicacion: _ubicacionController.text,
                          objetivo: _objetivoController.text,
                          cantidad: int.tryParse(_cantidadController.text) ?? 0,
                          categoria: _categoriaSeleccionada ?? '',
                          unidad: _unidadSeleccionada ?? '',
                          precio: double.tryParse(_precioController.text) ?? 0.0,
                          detalleMedida: _detalleMedidaController.text,
                        );

                        Provider.of<ProductoProvider>(context, listen: false)
                            .agregarProducto(producto);

                        _limpiarCampos();
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
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: label),
    );
  }

  Widget _buildNumericField(TextEditingController controller, String label) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: label),
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    );
  }
}
