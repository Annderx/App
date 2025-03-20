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
        title: const Text('Control de Asistencia'),
        centerTitle: true,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _buildFechaPicker(),
                _buildTextField(_nombreEmpleadoController, 'Nombre del Empleado', Icons.person),
                _buildTextField(_horaEntradaController, 'Hora de Entrada', Icons.timer),
                _buildTextField(_horaSalidaController, 'Hora de Salida', Icons.timer_off),
                _buildTextField(_notasController, 'Notas', Icons.note),
                const SizedBox(height: 20),
                _buildBotones(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFechaPicker() {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: const Icon(Icons.calendar_today, color: Colors.blue),
        title: Text(
          _fecha != null ? 'Fecha: ${_fecha!.toString().split(' ')[0]}' : 'Selecciona una fecha',
          style: const TextStyle(fontSize: 16),
        ),
        onTap: () async {
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
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  Widget _buildBotones(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton.icon(
          onPressed: () {
            if (_formKey.currentState!.validate() && _fecha != null) {
              final asistencia = Asistencia(
                fecha: _fecha!,
                nombreEmpleado: _nombreEmpleadoController.text,
                horaEntrada: _horaEntradaController.text,
                horaSalida: _horaSalidaController.text,
                notas: _notasController.text,
              );
              Provider.of<AsistenciaProvider>(context, listen: false).agregarAsistencia(asistencia);
              _limpiarCasillas();
            }
          },
          icon: const Icon(Icons.save),
          label: const Text('Guardar'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
        ),
        ElevatedButton.icon(
          onPressed: _limpiarCasillas,
          icon: const Icon(Icons.clear),
          label: const Text('Limpiar'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
        ),
      ],
    );
  }
}
