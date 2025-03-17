import 'package:flutter/material.dart';
import 'package:myapp/Administracion/Empleados/InformeEmpleados.dart';
import 'package:provider/provider.dart';
import 'empleado_provider.dart';
import 'ClasesEmpleados.dart';

class RegistroEmpleado extends StatefulWidget {
  const RegistroEmpleado({Key? key}) : super(key: key);

  @override
  _RegistroEmpleadoState createState() => _RegistroEmpleadoState();
}

class _RegistroEmpleadoState extends State<RegistroEmpleado> {
  final _formKey = GlobalKey<FormState>();

  // Controladores para los campos de texto
  final _codigoController = TextEditingController();
  final _nombreController = TextEditingController();
  final _telefonoController = TextEditingController();
  final _dniController = TextEditingController();
  final _direccionController = TextEditingController();
  final _sueldoController = TextEditingController();
  final _edadController = TextEditingController();

  String? _area;
  final List<String> _areas = ['Ventas', 'Marketing', 'Desarrollo']; // Datos de ejemplo

  String? _tipo;
  final List<String> _tipos = ['Tiempo completo', 'Medio tiempo', 'Freelance']; // Datos de ejemplo

  String? _funcion;
  final List<String> _funciones = ['Gerente', 'Analista', 'Desarrollador']; // Datos de ejemplo

  String? _condicion;
  final List<String> _condiciones = ['Activo', 'Inactivo']; // Datos de ejemplo

  DateTime? _fechaNacimiento;

  @override
  void initState() {
    super.initState();
    _generarCodigoEmpleado(); // Generar código inicial
  }

  Future<void> _generarCodigoEmpleado() async {
    // Lógica para generar un código único para el empleado
    // Puedes obtener el último código de la base de datos y aumentarlo
    // Por ahora, usaremos un código de ejemplo
    _codigoController.text = 'EMP-001';
  }

  // ignore: unused_element
  void _limpiarCasillas() {
    _codigoController.clear();
    _nombreController.clear();
    _telefonoController.clear();
    _dniController.clear();
    _direccionController.clear();
    _sueldoController.clear();
    _edadController.clear();
    _fechaNacimiento = null;

    setState(() {}); // Actualiza el estado para limpiar la fecha
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Empleados'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _codigoController,
                decoration: const InputDecoration(labelText: 'Código Empleado'),
                enabled: false,
              ),
              TextFormField(
                controller: _nombreController,
                decoration: const InputDecoration(labelText: 'Nombre'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese el nombre';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Área'),
                value: _area,
                items: _areas.map((area) => DropdownMenuItem<String>(
                      value: area,
                      child: Text(area),
                    )).toList(),
                onChanged: (value) {
                  setState(() {
                    _area = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Seleccione el área';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Tipo'),
                value: _tipo,
                items: _tipos.map((tipo) => DropdownMenuItem<String>(
                      value: tipo,
                      child: Text(tipo),
                    )).toList(),
                onChanged: (value) {
                  setState(() {
                    _tipo = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Seleccione el tipo';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Función'),
                value: _funcion,
                items: _funciones.map((funcion) => DropdownMenuItem<String>(
                      value: funcion,
                      child: Text(funcion),
                    )).toList(),
                onChanged: (value) {
                  setState(() {
                    _funcion = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Seleccione la función';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Condición'),
                value: _condicion,
                items: _condiciones.map((condicion) => DropdownMenuItem<String>(
                      value: condicion,
                      child: Text(condicion),
                    )).toList(),
                onChanged: (value) {
                  setState(() {
                    _condicion = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Seleccione la condición';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _telefonoController,
                decoration: const InputDecoration(labelText: 'Teléfono'),
              ),
              TextFormField(
                controller: _dniController,
                decoration: const InputDecoration(labelText: 'DNI'),
              ),
              TextFormField(
                controller: _direccionController,
                decoration: const InputDecoration(labelText: 'Dirección'),
              ),
              TextFormField(
                controller: _sueldoController,
                decoration: const InputDecoration(labelText: 'Sueldo'),
              ),
              TextFormField(
                controller: _edadController,
                decoration: const InputDecoration(labelText: 'Edad'),
              ),
              Row(
                children: [
                  Text(
                    _fechaNacimiento != null
                        ? 'Fecha de Nacimiento: ${_fechaNacimiento!.toString().split(' ')[0]}'
                        : 'Fecha de Nacimiento: ',
                  ),
                  IconButton(
                    onPressed: () async {
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      if (picked != null && picked != _fechaNacimiento) {
                        setState(() {
                          _fechaNacimiento = picked;
                        });
                      }
                    },
                    icon: const Icon(Icons.calendar_today),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final empleadoProvider = Provider.of<EmpleadoProvider>(context, listen: false);

                    final nuevoEmpleado = Empleado(
                      codigo: _codigoController.text,
                      nombre: _nombreController.text,
                      area: _area!,
                      tipo: _tipo!,
                      funcion: _funcion!,
                      condicion: _condicion!,
                      telefono: _telefonoController.text,
                      dni: _dniController.text,
                      direccion: _direccionController.text,
                      sueldo: _sueldoController.text,
                      edad: _edadController.text,
                      fechaNacimiento: _fechaNacimiento,
                    );

                    empleadoProvider.agregarEmpleado(nuevoEmpleado);

                    // Mostrar un diálogo o navegar a la lista de empleados
                  }
                },
                child: const Text('Guardar'),
              ),
              ElevatedButton(
  onPressed: () {
    if (_formKey.currentState!.validate()) {
      final empleadoProvider = Provider.of<EmpleadoProvider>(context, listen: false);

      final nuevoEmpleado = Empleado(
        codigo: _codigoController.text,
        nombre: _nombreController.text,
        area: _area!,
        tipo: _tipo!,
        funcion: _funcion!,
        condicion: _condicion!,
        telefono: _telefonoController.text,
        dni: _dniController.text,
        direccion: _direccionController.text,
        sueldo: _sueldoController.text,
        edad: _edadController.text,
        fechaNacimiento: _fechaNacimiento,
      );

      empleadoProvider.agregarEmpleado(nuevoEmpleado);

      // Mostrar un diálogo
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Empleado guardado'),
            content: const Text('¿Desea ver el informe de empleados?'),
            actions: <Widget>[
              TextButton(
                child: const Text('No'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Sí'),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InformeEmpleados(),
                    ),
                  );
                },
              ),
            ],
          );
        },
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
        ),
      ),
    );
  }
}