import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ClasesOficina.dart';
import 'clases_provider.dart';

class RegistroAreaTrabajo extends StatefulWidget {
  const RegistroAreaTrabajo({super.key});

  @override
  State<RegistroAreaTrabajo> createState() => _RegistroAreaTrabajoState();
}

class _RegistroAreaTrabajoState extends State<RegistroAreaTrabajo> {
  final _formKey = GlobalKey<FormState>();
  final _codigoAreaController = TextEditingController();
  final _nombreController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _cargarDatos();
  }

  Future<void> _cargarDatos() async {
    setState(() {});
  }

  void _limpiarCasillas() {
    _codigoAreaController.clear();
    _nombreController.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Área de Trabajo'),
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
                _buildTextField(_codigoAreaController, 'Código de Área', Icons.tag, enabled: false),
                _buildTextField(_nombreController, 'Nombre del Área', Icons.business),
                const SizedBox(height: 20),
                _buildBotones(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, IconData icon, {bool enabled = true}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        enabled: enabled,
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
            if (_formKey.currentState!.validate()) {
              final areaTrabajo = AreaTrabajo(
                codigoArea: int.tryParse(_codigoAreaController.text) ?? 0,
                nombre: _nombreController.text,
              );
              Provider.of<AreaTrabajoProvider>(context, listen: false).agregarAreaTrabajo(areaTrabajo);
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
