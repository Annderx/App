import 'package:flutter/material.dart';

/*class Pagossinplanilla extends StatelessWidget {
  const Pagossinplanilla({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Pagos (Coloboradores sin planilla)'),
      ),      
    );
  }
}*/

class RegistroPagoSinPlanilla extends StatefulWidget {
  const RegistroPagoSinPlanilla({super.key});

  @override
  State<RegistroPagoSinPlanilla> createState() =>
      _RegistroPagoSinPlanillaState();
}

class _RegistroPagoSinPlanillaState extends State<RegistroPagoSinPlanilla> {
  final _formKey = GlobalKey<FormState>();

  // Controladores para los campos de texto
  final _colaboradorController = TextEditingController();
  final _diasMesController = TextEditingController();
  final _diasLaboradosController = TextEditingController();
  final _diasFaltadosController = TextEditingController();
  final _sueldoBaseInicialController = TextEditingController();
  final _descuentoFaltasController = TextEditingController();
  final _sueldoBaseController = TextEditingController();
  final _bonoExtraordinarioController = TextEditingController();
  final _adelantoController = TextEditingController();
  final _otrosDescuentosController = TextEditingController();
  final _sueldoNetoController = TextEditingController();

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
    _colaboradorController.clear();
    _diasMesController.clear();
    _diasLaboradosController.clear();
    _diasFaltadosController.clear();
    _sueldoBaseInicialController.clear();
    _descuentoFaltasController.clear();
    _sueldoBaseController.clear();
    _bonoExtraordinarioController.clear();
    _adelantoController.clear();
    _otrosDescuentosController.clear();
    _sueldoNetoController.clear();
    _fecha = null;

    setState(() {}); // Actualiza el estado para limpiar la fecha
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Pago de Colaboradores Sin Planilla'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Fecha
              Row(
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
              // Colaborador
              TextFormField(
                controller: _colaboradorController,
                decoration: const InputDecoration(labelText: 'COLABORADOR:'),
              ),
              // Días del mes, días laborados y días faltados en la misma línea
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _diasMesController,
                      decoration: const InputDecoration(labelText: 'DIAS DEL MES:'),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _diasLaboradosController,
                      decoration: const InputDecoration(labelText: 'DIAS LABORADOS:'),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _diasFaltadosController,
                      decoration: const InputDecoration(labelText: 'DIAS FALTADOS:'),
                    ),
                  ),
                ],
              ),
              // Sueldo base inicial y descuento faltas en la misma línea
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _sueldoBaseInicialController,
                      decoration: const InputDecoration(labelText: 'SUELDO BASE INICIAL:'),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _descuentoFaltasController,
                      decoration: const InputDecoration(labelText: 'DESCUENTO FALTAS:'),
                    ),
                  ),
                ],
              ),
              // Sueldo base
              TextFormField(
                controller: _sueldoBaseController,
                decoration: const InputDecoration(labelText: 'SUELDO BASE:'),
              ),
              // Bono extraordinario, adelanto y otros descuentos en la misma línea
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _bonoExtraordinarioController,
                      decoration: const InputDecoration(labelText: 'BONO EXTRAORDINARIO:'),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _adelantoController,
                      decoration: const InputDecoration(labelText: 'ADELANTO:'),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _otrosDescuentosController,
                      decoration: const InputDecoration(labelText: 'OTROS DESCUENTOS:'),
                    ),
                  ),
                ],
              ),
              // Sueldo neto
              TextFormField(
                controller: _sueldoNetoController,
                decoration: const InputDecoration(labelText: 'SUELDO NETO:'),
              ),
              // Botón guardar
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Guardar los datos
                  }
                },
                child: const Text('GUARDAR'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}