import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ClasesSalida.dart';
import 'salida_provider.dart';

class RegistroSalidaProductos extends StatefulWidget {
  const RegistroSalidaProductos({super.key});

  @override
  State<RegistroSalidaProductos> createState() =>
      _RegistroSalidaProductosState();
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
  final _estadoController = TextEditingController(); // Agrega el controlador para el estado

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
    _estadoController.clear(); // Limpia el controlador del estado
    _fecha = null;

    setState(() {}); // Actualiza el estado para limpiar la fecha
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Salida de Productos'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Código de salida, fecha y estado en la misma línea
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _codigoSalidaController,
                      decoration: const InputDecoration(labelText: 'CODIGO SALIDA:'),
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
                  Expanded(
                    child: TextFormField(
                      controller: _estadoController,
                      decoration: const InputDecoration(labelText: 'ESTADO:'),
                    ),
                  ),
                ],
              ),
              // Datos del producto
              TextFormField(
                controller: _codigoProductoController,
                decoration: const InputDecoration(labelText: 'CODIGO PRODUCTO:'),
              ),
              TextFormField(
                controller: _descripcionController,
                decoration: const InputDecoration(labelText: 'DESCRIPCION:'),
              ),
              // Marca y unidad en la misma línea
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _marcaController,
                      decoration: const InputDecoration(labelText: 'MARCA:'),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _unidadController,
                      decoration: const InputDecoration(labelText: 'UNIDAD:'),
                    ),
                  ),
                ],
              ),
              // Cantidad, ubicación y precio en la misma línea
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _cantidadController,
                      decoration: const InputDecoration(labelText: 'CANTIDAD:'),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _ubicacionController,
                      decoration: const InputDecoration(labelText: 'UBICACION:'),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _precioController,
                      decoration: const InputDecoration(labelText: 'PRECIO:'),
                    ),
                  ),
                ],
              ),
              // Datos del empleado
              TextFormField(
                controller: _empleadoController,
                decoration: const InputDecoration(labelText: 'EMPLEADO:'),
              ),
              // Datos del vehículo
              TextFormField(
                controller: _placaVehiculoController,
                decoration: const InputDecoration(labelText: 'PLACA:'),
              ),
              // Botones en la misma línea
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {final salida = SalidaProducto(
                          id: DateTime.now().millisecondsSinceEpoch,
                          codigoSalida: _codigoSalidaController.text,
                          codigoProducto: _codigoProductoController.text,
                          descripcion: _descripcionController.text,
                          marca: _marcaController.text,
                          unidad: _unidadController.text,
                          cantidad: int.parse(_cantidadController.text),
                          ubicacion: _ubicacionController.text,
                          precio: double.parse(_precioController.text),
                          empleado: _empleadoController.text,
                          placaVehiculo: _placaVehiculoController.text,
                          estado: _estadoController.text,
                          fecha: _fecha!,
                        );
                        Provider.of<SalidaProviderAlmacen>(context, listen: false).agregarSalida(salida);
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