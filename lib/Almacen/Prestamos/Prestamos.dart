import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ClasesPrestamos.dart';
import 'prestamos_provider.dart';
import 'package:flutter/services.dart'; // Para formatear entradas numéricas

class RegistroPrestamosProductos extends StatefulWidget {
  const RegistroPrestamosProductos({super.key});

  @override
  State<RegistroPrestamosProductos> createState() => _RegistroPrestamosProductosState();
}

class _RegistroPrestamosProductosState extends State<RegistroPrestamosProductos> {
  final _formKey = GlobalKey<FormState>();

  // Controladores de texto
  final _codigoPrestamoController = TextEditingController();
  final _codigoEncargadoController = TextEditingController();
  final _nombreController = TextEditingController();
  final _descripcionController = TextEditingController();
  final _cantidadController = TextEditingController();
  final _prestatarioController = TextEditingController();

  DateTime? _fechaPrestamo;
  DateTime? _fechaDevolucion;

  // Variables para dropdown
  String? _medidaSeleccionada;

  @override
  void dispose() {
    // Liberar memoria de controladores
    _codigoPrestamoController.dispose();
    _codigoEncargadoController.dispose();
    _nombreController.dispose();
    _descripcionController.dispose();
    _cantidadController.dispose();
    _prestatarioController.dispose();
    super.dispose();
  }

  void _limpiarCampos() {
    _codigoPrestamoController.clear();
    _codigoEncargadoController.clear();
    _nombreController.clear();
    _descripcionController.clear();
    _cantidadController.clear();
    _prestatarioController.clear();
    _fechaPrestamo = null;
    _fechaDevolucion = null;
    _medidaSeleccionada = null;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Préstamos de Productos'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Código de Préstamo y Fecha de Préstamo
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _codigoPrestamoController,
                        decoration: const InputDecoration(labelText: 'Código de Préstamo'),
                        enabled: false,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              _fechaPrestamo != null
                                  ? 'Fecha de Préstamo: ${_fechaPrestamo!.toString().split(' ')[0]}'
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
                                  _fechaPrestamo = picked;
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

              // Información del Encargado y Préstamo
              ExpansionTile(
                title: const Text('Datos del Encargado y Producto'),
                children: [
                  _buildTextField(_codigoEncargadoController, 'Código Encargado'),
                  _buildTextField(_nombreController, 'Nombre del Producto'),
                  _buildTextField(_descripcionController, 'Descripción del Producto'),
                ],
              ),

              const SizedBox(height: 16),

              // Selección de Medida y Cantidad
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      DropdownButtonFormField<String>(
                        value: _medidaSeleccionada,
                        decoration: const InputDecoration(labelText: 'Medida'),
                        items: ['Unidad', 'Caja', 'Paquete']
                            .map((medida) => DropdownMenuItem(value: medida, child: Text(medida)))
                            .toList(),
                        onChanged: (value) => setState(() => _medidaSeleccionada = value),
                      ),
                      _buildNumericField(_cantidadController, 'Cantidad'),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Datos del Prestatario y Fecha de Devolución
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      _buildTextField(_prestatarioController, 'Prestatario'),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              _fechaDevolucion != null
                                  ? 'Fecha de Devolución: ${_fechaDevolucion!.toString().split(' ')[0]}'
                                  : 'Seleccione una Fecha',
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.calendar_today, color: Colors.redAccent),
                            onPressed: () async {
                              final DateTime? picked = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100),
                              );
                              if (picked != null) {
                                setState(() {
                                  _fechaDevolucion = picked;
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

              // Botones de acción
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    icon: const Icon(Icons.save),
                    label: const Text('Guardar'),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final prestamo = PrestamoProducto(
                          codigoPrestamo: int.tryParse(_codigoPrestamoController.text) ?? 0,
                          codigoEncargado: int.tryParse(_codigoEncargadoController.text) ?? 0,
                          nombre: _nombreController.text,
                          descripcion: _descripcionController.text,
                          fechaPrestamo: _fechaPrestamo ?? DateTime.now(),
                          fechaDevolucion: _fechaDevolucion,
                          medida: _medidaSeleccionada ?? '',
                          cantidad: int.tryParse(_cantidadController.text) ?? 0,
                          prestatario: _prestatarioController.text,
                        );

                        Provider.of<PrestamoProviderAlmacen>(context, listen: false)
                            .agregarPrestamo(prestamo);

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
