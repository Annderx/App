import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Para formatear la fecha

class RegistroOrdenTrabajo extends StatefulWidget {
  const RegistroOrdenTrabajo({super.key});

  @override
  _RegistroOrdenTrabajoState createState() => _RegistroOrdenTrabajoState();
}

class _RegistroOrdenTrabajoState extends State<RegistroOrdenTrabajo> {
  final _formKey = GlobalKey<FormState>();

  // Controladores para los campos de texto
  final _noCotController = TextEditingController();
  final _vehiculoController = TextEditingController();
  final _anoFabricacionController = TextEditingController();
  final _modeloController = TextEditingController();
  final _kmController = TextEditingController();
  final _cantidadController = TextEditingController();
  final _horasController = TextEditingController();
  final _anoModeloController = TextEditingController();
  final _marcaController = TextEditingController();
  final _placaController = TextEditingController();
  final _tipoUnidadController = TextEditingController();
  final _clienteController = TextEditingController();
  final _aseguradosController = TextEditingController();
  final _opcionesController = TextEditingController();
  final _descripcionController = TextEditingController();
  final _contactoController = TextEditingController();

  DateTime? _fechaIngreso;
  String? _tecnicoSeleccionado; // Para el técnico seleccionado

  // Lista de técnicos (puedes obtenerla de una API o base de datos)
  final List<String> _tecnicos = ['Técnico 1', 'Técnico 2', 'Técnico 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro de Orden de Trabajo')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _noCotController,
                decoration: const InputDecoration(labelText: 'Nº COT.:'),
              ),
              TextFormField(
                controller: _vehiculoController,
                decoration: const InputDecoration(labelText: 'VEHICULO:'),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _anoFabricacionController,
                      decoration: const InputDecoration(labelText: 'AÑO FABRICACION:'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: _modeloController,
                      decoration: const InputDecoration(labelText: 'MODELO:'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: _kmController,
                      decoration: const InputDecoration(labelText: 'KM:'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: _cantidadController,
                      decoration: const InputDecoration(labelText: 'CANTIDAD:'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: _horasController,
                      decoration: const InputDecoration(labelText: 'HORAS:'),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _anoModeloController,
                      decoration: const InputDecoration(labelText: 'AÑO MODELO:'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: _marcaController,
                      decoration: const InputDecoration(labelText: 'MARCA:'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: _placaController,
                      decoration: const InputDecoration(labelText: 'PLACA:'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: _tipoUnidadController,
                      decoration: const InputDecoration(labelText: 'TIPO UNIDAD:'),
                    ),
                  ),
                ],
              ),
              TextFormField(
                controller: _clienteController,
                decoration: const InputDecoration(labelText: 'CLIENTE:'),
              ),
              TextFormField(
                controller: _aseguradosController,
                decoration: const InputDecoration(labelText: 'ASEGURADOS:'),
              ),
              TextFormField(
                controller: _opcionesController,
                decoration: const InputDecoration(labelText: 'OPCIONES:'),
              ),
              TextFormField(
                controller: _descripcionController,
                decoration: const InputDecoration(labelText: 'DESCRIPCION:'),
              ),
              TextFormField(
                controller: _contactoController,
                decoration: const InputDecoration(labelText: 'CONTACTO:'),
              ),
              Row(
                children: [
                  Text(
                    _fechaIngreso != null
                        ? 'Fecha Ingreso: ${DateFormat('dd/MM/yyyy').format(_fechaIngreso!)}'
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
              DropdownButtonFormField<String>(
                value: _tecnicoSeleccionado,
                items: _tecnicos.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _tecnicoSeleccionado = value;
                  });
                },
                decoration: const InputDecoration(labelText: 'TECNICO:'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Lógica para guardar la orden de trabajo
                      }
                    },
                    child: const Text('GUARDAR'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Lógica para limpiar el formulario
                    },
                    child: const Text('NUEVO'),
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