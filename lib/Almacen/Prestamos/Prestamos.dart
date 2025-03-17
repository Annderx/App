import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ClasesPrestamos.dart';
import 'prestamos_provider.dart';

class RegistroPrestamosProductos extends StatefulWidget {
  const RegistroPrestamosProductos({super.key});

  @override
  State<RegistroPrestamosProductos> createState() =>
      _RegistroPrestamosProductosState();
}

class _RegistroPrestamosProductosState extends State<RegistroPrestamosProductos> {
  final _formKey = GlobalKey<FormState>();

  final _codigoPrestamoController = TextEditingController();
  final _codigoEncargadoController = TextEditingController();
  final _nombreController = TextEditingController();
  final _descripcionController = TextEditingController();
  final _medidaController = TextEditingController();
  final _cantidadController = TextEditingController();
  final _prestatarioController = TextEditingController();

  DateTime? _fechaPrestamo;
  DateTime? _fechaDevolucion;

  @override
  void initState() {
    super.initState();
    _cargarDatos();
  }

  Future<void> _cargarDatos() async {
    setState(() {});
  }

  void _limpiarCasillas() {
    _codigoPrestamoController.clear();
    _codigoEncargadoController.clear();
    _nombreController.clear();
    _descripcionController.clear();
    _medidaController.clear();
    _cantidadController.clear();
    _prestatarioController.clear();
    _fechaPrestamo = null;
    _fechaDevolucion = null;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Préstamos de Productos'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _codigoPrestamoController,
                decoration: const InputDecoration(labelText: 'CODIGO PRESTAMO:'),
                enabled: false,
              ),
              TextFormField(
                controller: _codigoEncargadoController,
                decoration: const InputDecoration(labelText: 'CODIGO ENCARGADO:'),
              ),
              TextFormField(
                controller: _nombreController,
                decoration: const InputDecoration(labelText: 'NOMBRE:'),
              ),
              TextFormField(
                controller: _descripcionController,
                decoration: const InputDecoration(labelText: 'DESCRIPCION:'),
              ),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          _fechaPrestamo != null
                              ? 'Fecha Pres.: ${_fechaPrestamo!.toString().split(' ')[0]}'
                              : 'Fecha Pres.: ',
                        ),
                        IconButton(
                          onPressed: () async {
                            final DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                            );
                            if (picked != null && picked != _fechaPrestamo) {
                              setState(() {
                                _fechaPrestamo = picked;
                              });
                            }
                          },
                          icon: const Icon(Icons.calendar_today),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          _fechaDevolucion != null
                              ? 'Fecha Dev.: ${_fechaDevolucion!.toString().split(' ')[0]}'
                              : 'Fecha Dev.: ',
                        ),
                        IconButton(
                          onPressed: () async {
                            final DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                            );
                            if (picked != null && picked != _fechaDevolucion) {
                              setState(() {
                                _fechaDevolucion = picked;
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
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _medidaController,
                      decoration: const InputDecoration(labelText: 'MEDIDA:'),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _cantidadController,
                      decoration: const InputDecoration(labelText: 'CANTIDAD:'),
                    ),
                  ),
                ],
              ),
              TextFormField(
                controller: _prestatarioController,
                decoration: const InputDecoration(labelText: 'PRESTATARIO:'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final prestamo = PrestamoProducto(
                          codigoPrestamo: int.tryParse(_codigoPrestamoController.text) ?? 0,
                          codigoEncargado: int.tryParse(_codigoEncargadoController.text) ?? 0,
                          nombre: _nombreController.text,
                          descripcion: _descripcionController.text,
                          fechaPrestamo: _fechaPrestamo ?? DateTime.now(),
                          fechaDevolucion: _fechaDevolucion,
                          medida: _medidaController.text,
                          cantidad: int.tryParse(_cantidadController.text) ?? 0,
                          prestatario: _prestatarioController.text,
                        );
                        Provider.of<PrestamoProviderAlmacen>(context, listen: false)
                            .agregarPrestamo(prestamo);
                      }
                    },
                    child: const Text('GUARDAR'),
                  ),
                  ElevatedButton(
                    onPressed: _limpiarCasillas,
                    child: const Text('LIMPIAR '),
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