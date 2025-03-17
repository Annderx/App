import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ClaseAsistencia.dart';
import 'asistencia_provider.dart';

class ControlAsistenciaPersonal extends StatefulWidget {
  const ControlAsistenciaPersonal({super.key});

  @override
  State<ControlAsistenciaPersonal> createState() =>
      _ControlAsistenciaPersonalState();
}

class _ControlAsistenciaPersonalState extends State<ControlAsistenciaPersonal> {
  final _formKey = GlobalKey<FormState>();

  DateTime? _fecha;
  final _nombreEmpleadoController = TextEditingController();
  final _horaEntradaController = TextEditingController();
  final _horaSalidaController = TextEditingController();
  final _notasController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _cargarDatos();
  }

  Future<void> _cargarDatos() async {
    setState(() {});
  }

  void _limpiarCasillas() {
    _fecha = null;
    _nombreEmpleadoController.clear();
    _horaEntradaController.clear();
    _horaSalidaController.clear();
    _notasController.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Control de Asistencia de Personal'),
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
                controller: _nombreEmpleadoController,
                decoration: const InputDecoration(labelText: 'Nombre del Empleado:'),
              ),
              TextFormField(
                controller: _horaEntradaController,
                decoration: const InputDecoration(labelText: 'Hora de Entrada:'),
              ),
              TextFormField(
                controller: _horaSalidaController,
                decoration: const InputDecoration(labelText: 'Hora de Salida:'),
              ),
              TextFormField(
                controller: _notasController,
                decoration: const InputDecoration(labelText: 'Notas:'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate() && _fecha != null) {
                        final asistencia = Asistencia(
                          fecha: _fecha!,
                          nombreEmpleado: _nombreEmpleadoController.text,
                          horaEntrada: _horaEntradaController.text,
                          horaSalida: _horaSalidaController.text,
                          notas: _notasController.text,
                        );
                        Provider.of<AsistenciaProvider>(context, listen: false)
                            .agregarAsistencia(asistencia);
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