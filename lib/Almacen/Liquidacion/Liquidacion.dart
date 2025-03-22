import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ClasesLiquidacion.dart';
import 'liquidacion_provider.dart';
import 'package:flutter/services.dart'; // Para formatear entradas numéricas

class RegistroLiquidacionProductos extends StatefulWidget {
  const RegistroLiquidacionProductos({super.key});

  @override
  State<RegistroLiquidacionProductos> createState() => _RegistroLiquidacionProductosState();
}

class _RegistroLiquidacionProductosState extends State<RegistroLiquidacionProductos> {
  final _formKey = GlobalKey<FormState>();

  // Controladores de texto
  final _codigoLiquidacionController = TextEditingController();
  final _motivoController = TextEditingController();
  final _proformaController = TextEditingController();
  final _descripcionProductoController = TextEditingController();
  final _medidaProductoController = TextEditingController();
  final _totalSolesController = TextEditingController();
  final _marcaProductoController = TextEditingController();
  final _totalDolaresController = TextEditingController();
  final _empleadoController = TextEditingController();
  final _placaVehiculoController = TextEditingController();
  final _clienteController = TextEditingController();
  final _precioProductoController = TextEditingController();
  final _cantidadProductoController = TextEditingController();
  final _proveedorController = TextEditingController();

  DateTime? _fechaEntrega;

  // Variables para dropdown
  String? _tipoDocumento;
  String? _condicion;
  String? _sistema;

  @override
  void dispose() {
    // Liberar controladores para evitar fugas de memoria
    _codigoLiquidacionController.dispose();
    _motivoController.dispose();
    _proformaController.dispose();
    _descripcionProductoController.dispose();
    _medidaProductoController.dispose();
    _totalSolesController.dispose();
    _marcaProductoController.dispose();
    _totalDolaresController.dispose();
    _empleadoController.dispose();
    _placaVehiculoController.dispose();
    _clienteController.dispose();
    _precioProductoController.dispose();
    _cantidadProductoController.dispose();
    _proveedorController.dispose();
    super.dispose();
  }

  void _limpiarCampos() {
    _codigoLiquidacionController.clear();
    _motivoController.clear();
    _proformaController.clear();
    _descripcionProductoController.clear();
    _medidaProductoController.clear();
    _totalSolesController.clear();
    _marcaProductoController.clear();
    _totalDolaresController.clear();
    _empleadoController.clear();
    _placaVehiculoController.clear();
    _clienteController.clear();
    _precioProductoController.clear();
    _cantidadProductoController.clear();
    _proveedorController.clear();
    _fechaEntrega = null;
    _tipoDocumento = null;
    _condicion = null;
    _sistema = null;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Liquidación de Productos'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Código de Liquidación y Fecha de Entrega
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _codigoLiquidacionController,
                        decoration: const InputDecoration(labelText: 'Código de Liquidación'),
                        enabled: false,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              _fechaEntrega != null
                                  ? 'Fecha de Entrega: ${_fechaEntrega!.toString().split(' ')[0]}'
                                  : 'Seleccione una Fecha',
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.calendar_today, color: Colors.blue),
                            onPressed: () async {
                              final DateTime? picked = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime.now(),
                              );
                              if (picked != null) {
                                setState(() {
                                  _fechaEntrega = picked;
                                });
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Selección de Tipo de Documento, Condición y Sistema
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      DropdownButtonFormField<String>(
                        value: _tipoDocumento,
                        decoration: const InputDecoration(labelText: 'Tipo de Documento'),
                        items: ['Factura', 'Boleta', 'Nota de Crédito']
                            .map((tipo) => DropdownMenuItem(value: tipo, child: Text(tipo)))
                            .toList(),
                        onChanged: (value) => setState(() => _tipoDocumento = value),
                      ),
                      DropdownButtonFormField<String>(
                        value: _condicion,
                        decoration: const InputDecoration(labelText: 'Condición'),
                        items: ['Nuevo', 'Usado', 'Defectuoso']
                            .map((cond) => DropdownMenuItem(value: cond, child: Text(cond)))
                            .toList(),
                        onChanged: (value) => setState(() => _condicion = value),
                      ),
                      DropdownButtonFormField<String>(
                        value: _sistema,
                        decoration: const InputDecoration(labelText: 'Sistema'),
                        items: ['SAP', 'Manual', 'Automatizado']
                            .map((sist) => DropdownMenuItem(value: sist, child: Text(sist)))
                            .toList(),
                        onChanged: (value) => setState(() => _sistema = value),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Información del Producto
              ExpansionTile(
                title: const Text('Datos del Producto'),
                children: [
                  _buildTextField(_descripcionProductoController, 'Descripción'),
                  _buildTextField(_marcaProductoController, 'Marca'),
                  _buildTextField(_medidaProductoController, 'Medida'),
                  _buildNumericField(_precioProductoController, 'Precio'),
                  _buildNumericField(_cantidadProductoController, 'Cantidad'),
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
                        // Guardar los datos
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
