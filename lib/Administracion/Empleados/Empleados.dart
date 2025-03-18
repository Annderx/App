import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'empleado_provider.dart';
import 'ClasesEmpleados.dart';
import 'InformeEmpleados.dart';

class RegistroEmpleado extends StatefulWidget {
  const RegistroEmpleado({Key? key}) : super(key: key);

  @override
  _RegistroEmpleadoState createState() => _RegistroEmpleadoState();
}

class _RegistroEmpleadoState extends State<RegistroEmpleado> {
  final _formKey = GlobalKey<FormState>();

  // Controladores para los campos de texto
  final TextEditingController _codigoController = TextEditingController();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();
  final TextEditingController _dniController = TextEditingController();
  final TextEditingController _direccionController = TextEditingController();
  final TextEditingController _sueldoController = TextEditingController();
  final TextEditingController _edadController = TextEditingController();

  String? _area, _tipo, _funcion, _condicion;
  DateTime? _fechaNacimiento;

  final List<String> _areas = ['Ventas', 'Marketing', 'Desarrollo'];
  final List<String> _tipos = ['Tiempo completo', 'Medio tiempo', 'Freelance'];
  final List<String> _funciones = ['Gerente', 'Analista', 'Desarrollador'];
  final List<String> _condiciones = ['Activo', 'Inactivo'];

  @override
  void initState() {
    super.initState();
    _generarCodigoEmpleado();
  }

  Future<void> _generarCodigoEmpleado() async {
    _codigoController.text = 'EMP-${DateTime.now().millisecondsSinceEpoch}';
  }

  void _limpiarCasillas() {
    _codigoController.clear();
    _nombreController.clear();
    _telefonoController.clear();
    _dniController.clear();
    _direccionController.clear();
    _sueldoController.clear();
    _edadController.clear();
    _fechaNacimiento = null;

    setState(() {}); // Actualiza la UI
  }

  void _guardarEmpleado() {
    if (!_formKey.currentState!.validate()) return;

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

    _mostrarDialogoConfirmacion();
  }

  void _mostrarDialogoConfirmacion() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Empleado guardado'),
        content: const Text('¿Desea ver el informe de empleados?'),
        actions: [
          TextButton(
            child: const Text('No'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: const Text('Sí'),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.push(context, MaterialPageRoute(builder: (context) => const InformeEmpleados()));
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown(String label, String? value, List<String> items, Function(String?) onChanged) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(labelText: label),
      value: value,
      items: items.map((item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
      onChanged: onChanged,
      validator: (value) => value == null ? 'Seleccione $label' : null,
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {bool enabled = true}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: label),
      validator: (value) => (value == null || value.isEmpty) ? 'Ingrese $label' : null,
      enabled: enabled,
    );
  }

  Widget _buildFechaNacimientoSelector() {
    return Row(
      children: [
        Text(
          _fechaNacimiento != null
              ? 'Fecha de Nacimiento: ${_fechaNacimiento!.toLocal().toString().split(' ')[0]}'
              : 'Fecha de Nacimiento:',
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
              setState(() => _fechaNacimiento = picked);
            }
          },
          icon: const Icon(Icons.calendar_today),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro de Empleados')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField('Código Empleado', _codigoController, enabled: false),
              _buildTextField('Nombre', _nombreController),
              _buildDropdown('Área', _area, _areas, (value) => setState(() => _area = value)),
              _buildDropdown('Tipo', _tipo, _tipos, (value) => setState(() => _tipo = value)),
              _buildDropdown('Función', _funcion, _funciones, (value) => setState(() => _funcion = value)),
              _buildDropdown('Condición', _condicion, _condiciones, (value) => setState(() => _condicion = value)),
              _buildTextField('Teléfono', _telefonoController),
              _buildTextField('DNI', _dniController),
              _buildTextField('Dirección', _direccionController),
              _buildTextField('Sueldo', _sueldoController),
              _buildTextField('Edad', _edadController),
              _buildFechaNacimientoSelector(),
              const SizedBox(height: 20),
              Wrap(
                spacing: 10,
                children: [
                  ElevatedButton(onPressed: _guardarEmpleado, child: const Text('Guardar')),
                  ElevatedButton(onPressed: _limpiarCasillas, child: const Text('Limpiar')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
