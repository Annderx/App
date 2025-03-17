import 'package:flutter/material.dart';
import "package:myapp/Almacen/EntradaSalida/ClasesEntrada.dart";
import 'package:myapp/Almacen/EntradaSalida/entrada_provider.dart';
import 'package:provider/provider.dart';

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
  void initState() {
    super.initState();
    _cargarDatos(); // Llama a la función para cargar los datos iniciales
  }

  Future<void> _cargarDatos() async {
    // Aquí puedes cargar los datos desde una base de datos o API
    // Por ejemplo:
    // _proveedores = await obtenerProveedores();

    // Luego, actualiza el estado para que los DropdownButton se actualicen
    setState(() {});
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
    _fecha = null;

    setState(() {}); // Actualiza el estado para limpiar la fecha
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
              // Código de entrada y fecha en la misma línea
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _codigoEntradaController,
                      decoration: const InputDecoration(
                        labelText: 'CODIGO ENTRADA:',
                      ),
                      enabled: false,
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          _fecha != null
                              ? 'Fecha: ${_fecha!.toString().split(' ')[0]}'
                              : 'Fecha: ',
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
                              setState(() {
                                _fecha = picked;
                              });
                            }
                          },
                          icon: const Icon(Icons.calendar_today),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // Datos del empleado y proveedor en la misma línea
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _empleadoController,
                      decoration: const InputDecoration(labelText: 'EMPLEADO:'),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _proveedorController,
                      decoration: const InputDecoration(
                        labelText: 'PROVEEDOR:',
                      ),
                    ),
                  ),
                ],
              ),
              // Datos del cliente y vehículo en la misma línea
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _clienteController,
                      decoration: const InputDecoration(labelText: 'CLIENTE:'),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _placaVehiculoController,
                      decoration: const InputDecoration(labelText: 'PLACA:'),
                    ),
                  ),
                ],
              ),
              // Datos del producto
              TextFormField(
                controller: _codigoProductoController,
                decoration: const InputDecoration(
                  labelText: 'CODIGO PRODUCTO:',
                ),
              ),
              TextFormField(
                controller: _marcaProductoController,
                decoration: const InputDecoration(labelText: 'MARCA:'),
              ),
              TextFormField(
                controller: _descripcionProductoController,
                decoration: const InputDecoration(labelText: 'DESCRIPCION:'),
              ),
              TextFormField(
                controller: _unidadProductoController,
                decoration: const InputDecoration(labelText: 'UNIDAD:'),
              ),
              TextFormField(
                controller: _cantidadProductoController,
                decoration: const InputDecoration(labelText: 'CANTIDAD:'),
              ),
              TextFormField(
                controller: _precioProductoController,
                decoration: const InputDecoration(labelText: 'PRECIO:'),
              ),
              // Botones en la misma línea
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final entrada = EntradaProducto(
                          id: DateTime.now().millisecondsSinceEpoch,
                          codigoEntrada: _codigoEntradaController.text,
                          codigoProducto: _codigoProductoController.text,
                          descripcionProducto:
                              _descripcionProductoController.text,
                          cantidadProducto: int.parse(
                            _cantidadProductoController.text,
                          ),
                          precioProducto: double.parse(
                            _precioProductoController.text,
                          ),
                          marcaProducto: _marcaProductoController.text,
                          unidadProducto: _unidadProductoController.text,
                          empleado: _empleadoController.text,
                          proveedor: _proveedorController.text,
                          cliente: _clienteController.text,
                          placaVehiculo: _placaVehiculoController.text,
                          fecha: _fecha!,
                        );
                        Provider.of<EntradaProviderAlmacen>(
                          context,
                          listen: false,
                        ).agregarEntrada(entrada);
                        _limpiarCasillas();
                      }
                    },
                    child: const Text('GUARDAR'),
                  ),
                  ElevatedButton(
                    onPressed: _limpiarCasillas,
                    child: const Text('LIMPIAR'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
