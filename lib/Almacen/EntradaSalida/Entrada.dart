import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myapp/Almacen/EntradaSalida/ClasesEntrada.dart';
import 'package:myapp/Almacen/EntradaSalida/entrada_provider.dart';

class RegistroEntradaProductos extends StatefulWidget {
  const RegistroEntradaProductos({super.key});

  @override
  State<RegistroEntradaProductos> createState() =>
      _RegistroEntradaProductosState();
}

class _RegistroEntradaProductosState extends State<RegistroEntradaProductos> {
  final _formKey = GlobalKey<FormState>();

  // Controladores para los campos de texto
  final _codigoEntradaController = TextEditingController();
  final _codigoProductoController = TextEditingController();
  final _descripcionProductoController = TextEditingController();
  final _cantidadProductoController = TextEditingController();
  final _precioProductoController = TextEditingController();
  final _marcaProductoController = TextEditingController();
  final _unidadProductoController = TextEditingController();
  final _empleadoController = TextEditingController();
  final _proveedorController = TextEditingController();
  final _clienteController = TextEditingController();
  final _placaVehiculoController = TextEditingController();

  DateTime? _fecha;

  @override
  void dispose() {
    _codigoEntradaController.dispose();
    _codigoProductoController.dispose();
    _descripcionProductoController.dispose();
    _cantidadProductoController.dispose();
    _precioProductoController.dispose();
    _marcaProductoController.dispose();
    _unidadProductoController.dispose();
    _empleadoController.dispose();
    _proveedorController.dispose();
    _clienteController.dispose();
    _placaVehiculoController.dispose();
    super.dispose();
  }

  void _limpiarCasillas() {
    _codigoEntradaController.clear();
    _codigoProductoController.clear();
    _descripcionProductoController.clear();
    _cantidadProductoController.clear();
    _precioProductoController.clear();
    _marcaProductoController.clear();
    _unidadProductoController.clear();
    _empleadoController.clear();
    _proveedorController.clear();
    _clienteController.clear();
    _placaVehiculoController.clear();
    setState(() => _fecha = null);
  }

  Future<void> _seleccionarFecha() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        _fecha = pickedDate;
      });
    }
  }

  Widget _campoTexto(
      {required TextEditingController controller,
      required String label,
      TextInputType? tipo,
      bool enabled = true}) {
    return TextFormField(
      controller: controller,
      keyboardType: tipo ?? TextInputType.text,
      enabled: enabled,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) return 'Campo requerido';
        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro de Entrada de Productos')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // Código de entrada y fecha
                Row(
                  children: [
                    Expanded(child: _campoTexto(controller: _codigoEntradaController, label: 'Código de Entrada', enabled: false)),
                    const SizedBox(width: 10),
                    Expanded(
                      child: GestureDetector(
                        onTap: _seleccionarFecha,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _fecha != null ? '${_fecha!.day}/${_fecha!.month}/${_fecha!.year}' : 'Seleccionar Fecha',
                                style: const TextStyle(fontSize: 16),
                              ),
                              const Icon(Icons.calendar_today, color: Colors.grey),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Empleado y Proveedor
                Row(
                  children: [
                    Expanded(child: _campoTexto(controller: _empleadoController, label: 'Empleado')),
                    const SizedBox(width: 10),
                    Expanded(child: _campoTexto(controller: _proveedorController, label: 'Proveedor')),
                  ],
                ),
                const SizedBox(height: 16),

                // Cliente y Placa del Vehículo
                Row(
                  children: [
                    Expanded(child: _campoTexto(controller: _clienteController, label: 'Cliente')),
                    const SizedBox(width: 10),
                    Expanded(child: _campoTexto(controller: _placaVehiculoController, label: 'Placa del Vehículo')),
                  ],
                ),
                const SizedBox(height: 16),

                // Datos del Producto
                _campoTexto(controller: _codigoProductoController, label: 'Código del Producto'),
                const SizedBox(height: 12),
                _campoTexto(controller: _marcaProductoController, label: 'Marca'),
                const SizedBox(height: 12),
                _campoTexto(controller: _descripcionProductoController, label: 'Descripción'),
                const SizedBox(height: 12),

                // Unidad, Cantidad y Precio
                Row(
                  children: [
                    Expanded(child: _campoTexto(controller: _unidadProductoController, label: 'Unidad')),
                    const SizedBox(width: 10),
                    Expanded(child: _campoTexto(controller: _cantidadProductoController, label: 'Cantidad', tipo: TextInputType.number)),
                    const SizedBox(width: 10),
                    Expanded(child: _campoTexto(controller: _precioProductoController, label: 'Precio', tipo: TextInputType.number)),
                  ],
                ),
                const SizedBox(height: 20),

                // Botones
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final entrada = EntradaProducto(
                            id: DateTime.now().millisecondsSinceEpoch,
                            codigoEntrada: _codigoEntradaController.text,
                            codigoProducto: _codigoProductoController.text,
                            descripcionProducto: _descripcionProductoController.text,
                            cantidadProducto: int.parse(_cantidadProductoController.text),
                            precioProducto: double.parse(_precioProductoController.text),
                            marcaProducto: _marcaProductoController.text,
                            unidadProducto: _unidadProductoController.text,
                            empleado: _empleadoController.text,
                            proveedor: _proveedorController.text,
                            cliente: _clienteController.text,
                            placaVehiculo: _placaVehiculoController.text,
                            fecha: _fecha!,
                          );
                          Provider.of<EntradaProviderAlmacen>(context, listen: false).agregarEntrada(entrada);
                          _limpiarCasillas();
                        }
                      },
                      icon: const Icon(Icons.save),
                      label: const Text('Guardar'),
                    ),
                    ElevatedButton.icon(
                      onPressed: _limpiarCasillas,
                      icon: const Icon(Icons.refresh),
                      label: const Text('Limpiar'),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[600]),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
