import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ClasesCorizacion.dart';
import 'cotizacion_provider.dart';

class RegistroCotizacion extends StatefulWidget {
  const RegistroCotizacion({super.key});

  @override
  State<RegistroCotizacion> createState() => _RegistroCotizacionState();
}

class _RegistroCotizacionState extends State<RegistroCotizacion> {
  final _formKey = GlobalKey<FormState>();

  // Controladores para los campos de texto
  final _codCotizacionController = TextEditingController();
  final _clienteController = TextEditingController();
  final _tipoVehiculoController = TextEditingController();
  final _placaController = TextEditingController();
  final _marcaVehiculoController = TextEditingController();
  final _modeloVehiculoController = TextEditingController();
  final _empresaProveedorController = TextEditingController();
  final _rucProveedorController = TextEditingController();
  final _cotProvController = TextEditingController();
  final _proveedorController = TextEditingController();
  final _telefonoProveedorController = TextEditingController();
  final _marcaProductoController = TextEditingController();
  final _medidaProductoController = TextEditingController();
  final _descripcionProductoController = TextEditingController();
  final _precioProductoController = TextEditingController();
  final _cantidadProductoController = TextEditingController();
  final _subtotalController = TextEditingController();
  final _igvController = TextEditingController();
  final _totalController = TextEditingController();

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

  // ignore: unused_element
  void _limpiarCasillas() {
    _codCotizacionController.clear();
    _clienteController.clear();
    _tipoVehiculoController.clear();
    _placaController.clear();
    _marcaVehiculoController.clear();
    _modeloVehiculoController.clear();
    _empresaProveedorController.clear();
    _rucProveedorController.clear();
    _cotProvController.clear();
    _proveedorController.clear();
    _telefonoProveedorController.clear();
    _marcaProductoController.clear();
    _medidaProductoController.clear();
    _descripcionProductoController.clear();
    _precioProductoController.clear();
    _cantidadProductoController.clear();
    _subtotalController.clear();
    _igvController.clear();
    _totalController.clear();
    _fecha = null;

    setState(() {}); // Actualiza el estado para limpiar la fecha
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Cotización'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Código de cotización y fecha en la misma línea
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _codCotizacionController,
                      decoration: const InputDecoration(labelText: 'COD. COT:'),
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
              // Cliente
              TextFormField(
                controller: _clienteController,
                decoration: const InputDecoration(labelText: 'CLIENTE:'),
              ),
              // Datos del vehículo en la misma línea
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _tipoVehiculoController,
                      decoration: const InputDecoration(labelText: 'TIPO:'),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _placaController,
                      decoration: const InputDecoration(labelText: 'PLACA:'),
                    ),
                  ),
                ],
              ),
              // Marca y modelo del vehículo en la misma línea
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _marcaVehiculoController,
                      decoration: const InputDecoration(labelText: 'MARCA:'),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _modeloVehiculoController,
                      decoration: const InputDecoration(labelText: 'MODELO:'),
                    ),
                  ),
                ],
              ),
              // Datos del proveedor
              TextFormField(
                controller: _empresaProveedorController,
                decoration: const InputDecoration(labelText: 'EMPRESA:'),
              ),
              TextFormField(
                controller: _rucProveedorController,
                decoration: const InputDecoration(labelText: 'RUC:'),
              ),
              TextFormField(
                controller: _cotProvController,
                decoration: const InputDecoration(labelText: 'COT. PROV.:'),
              ),
              TextFormField(
                controller: _proveedorController,
                decoration: const InputDecoration(labelText: 'PROVEEDOR:'),
              ),
              TextFormField(
                controller: _telefonoProveedorController,
                decoration: const InputDecoration(labelText: 'TELEFONO:'),
              ),
              // Datos del producto
              TextFormField(
                controller: _marcaProductoController,
                decoration: const InputDecoration(labelText: 'MARCA:'),
              ),
              TextFormField(
                controller: _medidaProductoController,
                decoration: const InputDecoration(labelText: 'MEDIDA:'),
              ),
              TextFormField(
                controller: _descripcionProductoController,
                decoration: const InputDecoration(labelText: 'DESCRIPCION:'),
              ),
              // Precio y cantidad del producto en la misma línea
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _precioProductoController,
                      decoration: const InputDecoration(labelText: 'PRECIO:'),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _cantidadProductoController,
                      decoration: const InputDecoration(labelText: 'CANTIDAD:'),
                    ),
                  ),
                ],
              ),
              // Subtotal, IGV y Total
              TextFormField(
                controller: _subtotalController,
                decoration: const InputDecoration(labelText: 'SUBTOTAL:'),
              ),
              TextFormField(
                controller: _igvController,
                decoration: const InputDecoration(labelText: 'IGV:'),
              ),
              TextFormField(
                controller: _totalController,
                decoration: const InputDecoration(labelText: 'TOTAL:'),
              ),
              // Botones en la misma línea
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final cotizacion = Cotizacion(
                          id: DateTime.now().millisecondsSinceEpoch,
                          codCotizacion: _codCotizacionController.text,
                          cliente: _clienteController.text,
                          tipoVehiculo: _tipoVehiculoController.text,
                          placa: _placaController.text,
                          marcaVehiculo: _marcaVehiculoController.text,
                          modeloVehiculo: _modeloVehiculoController.text,
                          empresaProveedor: _empresaProveedorController.text,
                          rucProveedor: _rucProveedorController.text,
                          cotProv: _cotProvController.text,
                          proveedor: _proveedorController.text,
                          telefonoProveedor: _telefonoProveedorController.text,
                          marcaProducto: _marcaProductoController.text,
                          medidaProducto: _medidaProductoController.text,
                          descripcionProducto: _descripcionProductoController.text,
                          precioProducto: double.parse(_precioProductoController.text),
                          cantidadProducto: int.parse(_cantidadProductoController.text),
                          subtotal: double.parse(_subtotalController.text),
                          igv: double.parse(_igvController.text),
                          total: double.parse(_totalController.text),
                          fecha: _fecha!,
                        );
                        Provider.of<CotizacionProvider>(context, listen: false)
                            .agregarCotizacion(cotizacion);
                        _limpiarCasillas();
                      }
                    },
                    child: const Text('Guardar'),
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