import 'package:flutter/material.dart';
import 'package:myapp/Taller/Presupuesto/ClasesPresupuesto.dart';
import 'package:provider/provider.dart';
import 'package:myapp/Taller/Presupuesto/presupuesto_provider.dart';

class RegistroPresupuesto extends StatefulWidget {
  const RegistroPresupuesto({super.key});

  @override
  State<RegistroPresupuesto> createState() => _RegistroPresupuestoState();
}

class _RegistroPresupuestoState extends State<RegistroPresupuesto> {
  final _formKey = GlobalKey<FormState>();

  // Controladores para los campos de texto
  final _noPresupuestoController = TextEditingController();
  final _vehiculoController = TextEditingController();
  final _anoFabricacionController = TextEditingController();
  final _modeloController = TextEditingController();
  final _anoModeloController = TextEditingController();
  final _marcaController = TextEditingController();
  final _combustibleController = TextEditingController();
  final _clienteController = TextEditingController();
  final _contactoController = TextEditingController();
  final _kmController = TextEditingController();
  final _placaController = TextEditingController();
  final _precioController = TextEditingController();
  final _unidadController = TextEditingController();
  final _cantidadController = TextEditingController();
  final _tipoController = TextEditingController();
  final _opcionesController = TextEditingController();
  final _repuestosController = TextEditingController();
  final _descripcionController = TextEditingController();
  final _subtotalController = TextEditingController();
  final _igvController = TextEditingController();
  final _totalController = TextEditingController();

  DateTime? _fechaIngreso;

  @override
  void initState() {
    super.initState();
    _cargarDatos();
  }

  Future<void> _cargarDatos() async {
    // Aquí puedes cargar los datos desde una base de datos o API
    // Por ejemplo:
    // _proveedores = await obtenerProveedores();

    // Luego, actualiza el estado para que los DropdownButton se actualicen
    setState(() {});
  }

  void _limpiarCasillas() {
    _noPresupuestoController.clear();
    _vehiculoController.clear();
    _anoFabricacionController.clear();
    _modeloController.clear();
    _anoModeloController.clear();
    _marcaController.clear();
    _combustibleController.clear();
    _clienteController.clear();
    _contactoController.clear();
    _kmController.clear();
    _placaController.clear();
    _precioController.clear();
    _unidadController.clear();
    _cantidadController.clear();
    _tipoController.clear();
    _opcionesController.clear();
    _repuestosController.clear();
    _descripcionController.clear();
    _subtotalController.clear();
    _igvController.clear();
    _totalController.clear();
    _fechaIngreso = null;

    setState(() {}); // Actualiza el estado para limpiar la fecha
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro de Presupuesto')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Número de presupuesto
              TextFormField(
                controller: _noPresupuestoController,
                decoration: const InputDecoration(labelText: 'Nº PRE.:'),
              ),
              // Datos del vehículo
              TextFormField(
                controller: _vehiculoController,
                decoration: const InputDecoration(labelText: 'VEHICULO:'),
              ),
              // Año de fabricación y modelo en la misma línea
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _anoFabricacionController,
                      decoration: const InputDecoration(labelText: 'AÑO FAB.:'),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _modeloController,
                      decoration: const InputDecoration(labelText: 'MODELO:'),
                    ),
                  ),
                ],
              ),
              // Año modelo y marca en la misma línea
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _anoModeloController,
                      decoration: const InputDecoration(
                        labelText: 'AÑO MODELO:',
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _marcaController,
                      decoration: const InputDecoration(labelText: 'MARCA:'),
                    ),
                  ),
                ],
              ),
              // Combustible y placa
              TextFormField(
                controller: _combustibleController,
                decoration: const InputDecoration(labelText: 'COMBUSTIBLE:'),
              ),
              TextFormField(
                controller: _placaController,
                decoration: const InputDecoration(labelText: 'PLACA:'),
              ),
              // Cliente y contacto
              TextFormField(
                controller: _clienteController,
                decoration: const InputDecoration(labelText: 'CLIENTE:'),
              ),
              TextFormField(
                controller: _contactoController,
                decoration: const InputDecoration(labelText: 'CONTACTO:'),
              ),
              // Fecha de ingreso, KM, unidad y cantidad en la misma línea
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          _fechaIngreso != null
                              ? 'Fecha Ingreso: ${_fechaIngreso!.toString().split(' ')[0]}'
                              : 'Fecha Ingreso: ',
                        ),
                        IconButton(
                          onPressed: () async {
                            final DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                            );
                            if (picked != null && picked != _fechaIngreso) {
                              setState(() {
                                _fechaIngreso = picked;
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
                      controller: _kmController,
                      decoration: const InputDecoration(labelText: 'KM:'),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _unidadController,
                      decoration: const InputDecoration(labelText: 'UNIDAD:'),
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
              // Tipo, opciones y repuestos
              TextFormField(
                controller: _tipoController,
                decoration: const InputDecoration(labelText: 'TIPO:'),
              ),
              TextFormField(
                controller: _opcionesController,
                decoration: const InputDecoration(labelText: 'OPCIONES:'),
              ),
              TextFormField(
                controller: _repuestosController,
                decoration: const InputDecoration(labelText: 'REPUESTOS:'),
              ),
              // Precio
              TextFormField(
                controller: _precioController,
                decoration: const InputDecoration(labelText: 'PRECIO:'),
              ),
              // Descripción
              TextFormField(
                controller: _descripcionController,
                decoration: const InputDecoration(labelText: 'DESCRIPCION:'),
              ),
              // Subtotal, IGV y total
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
                        // Crear una instancia de Presupuesto con los datos del formulario
                        Presupuesto nuevoPresupuesto = Presupuesto(
                          noPresupuesto: _noPresupuestoController.text,
                          vehiculo: _vehiculoController.text,
                          anoFabricacion: _anoFabricacionController.text,
                          modelo: _modeloController.text,
                          anoModelo: _anoModeloController.text,
                          marca: _marcaController.text,
                          combustible: _combustibleController.text,
                          cliente: _clienteController.text,
                          contacto: _contactoController.text,
                          fechaIngreso: _fechaIngreso,
                          km: _kmController.text,
                          placa: _placaController.text,
                          precio: _precioController.text,
                          unidad: _unidadController.text,
                          cantidad: _cantidadController.text,
                          tipo: _tipoController.text,
                          opciones: _opcionesController.text,
                          repuestos: _repuestosController.text,
                          descripcion: _descripcionController.text,
                          subtotal: _subtotalController.text,
                          igv: _igvController.text,
                          total: _totalController.text,
                        );

                        // Agregar el nuevo presupuesto al Provider
                        Provider.of<PresupuestoProvider>(
                          context,
                          listen: false,
                        ).agregarPresupuesto(nuevoPresupuesto);

                        // Limpiar las casillas y mostrar un mensaje
                        _limpiarCasillas();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Presupuesto guardado correctamente'),
                          ),
                        );
                      }
                    },
                    child: const Text('Guardar'),
                  ),
                  ElevatedButton(
                    onPressed: _limpiarCasillas,
                    child: const Text('Limpiar'),
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
