import 'package:flutter/material.dart';

class RegistroPagoConPlanilla extends StatefulWidget {
  const RegistroPagoConPlanilla({super.key});

  @override
  State<RegistroPagoConPlanilla> createState() =>
      _RegistroPagoConPlanillaState();
}

class _RegistroPagoConPlanillaState extends State<RegistroPagoConPlanilla> {
  final _formKey = GlobalKey<FormState>();

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
    setState(() {});
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
              TextFormField(
                controller: _colaboradorController,
                decoration: const InputDecoration(labelText: 'COLABORADOR:'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa el nombre del colaborador';
                  }
                  return null;
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _diasMesController,
                      decoration: const InputDecoration(
                        labelText: 'DIAS DEL MES:',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingresa los días del mes';
                        }
                        return null;
                      },
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _diasLaboradosController,
                      decoration: const InputDecoration(
                        labelText: 'DIAS LABORADOS:',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingresa los días laborados';
                        }
                        return null;
                      },
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _diasFaltadosController,
                      decoration: const InputDecoration(
                        labelText: 'DIAS FALTADOS:',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingresa los días faltados';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _sueldoBaseInicialController,
                      decoration: const InputDecoration(
                        labelText: 'SUELDO BASE INICIAL:',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingresa el sueldo base inicial';
                        }
                        return null;
                      },
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _descuentoFaltasController,
                      decoration: const InputDecoration(
                        labelText: 'DESCUENTO FALTAS:',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingresa el descuento por faltas';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              TextFormField(
                controller: _sueldoBaseController,
                decoration: const InputDecoration(labelText: 'SUELDO BASE:'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingresa el sueldo base';
                  }
                  return null;
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _bonoExtraordinarioController,
                      decoration: const InputDecoration(
                        labelText: 'BONO EXTRAORDINARIO:',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingresa el bono extraordinario';
                        }
                        return null;
                      },
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _adelantoController,
                      decoration: const InputDecoration(labelText: 'ADELANTO:'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingresa el adelanto';
                        }
                        return null;
                      },
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _otrosDescuentosController,
                      decoration: const InputDecoration(
                        labelText: 'OTROS DESCUENTOS:',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingresa otros descuentos';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              TextFormField(
                controller: _sueldoNetoController,
                decoration: const InputDecoration(labelText: 'SUELDO NETO:'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingresa el sueldo neto';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Guardar los datos
                    _limpiarCasillas(); // Limpiar después de guardar
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
