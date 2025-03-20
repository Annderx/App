import 'package:flutter/material.dart';

class RegistroPagoSinPlanilla extends StatefulWidget {
  const RegistroPagoSinPlanilla({super.key});

  @override
  State<RegistroPagoSinPlanilla> createState() => _RegistroPagoSinPlanillaState();
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
        title: const Text('Registro de Pago - Sin Planilla'),
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
                _buildFechaSelector(),
                _buildTextField(_colaboradorController, 'Colaborador', Icons.person),
                _buildRowFields([
                  _buildTextField(_diasMesController, 'Días del Mes', Icons.calendar_today, isNumeric: true),
                  _buildTextField(_diasLaboradosController, 'Días Laborados', Icons.work, isNumeric: true),
                  _buildTextField(_diasFaltadosController, 'Días Faltados', Icons.error, isNumeric: true),
                ]),
                _buildRowFields([
                  _buildTextField(_sueldoBaseInicialController, 'Sueldo Base Inicial', Icons.attach_money, isNumeric: true),
                  _buildTextField(_descuentoFaltasController, 'Descuento Faltas', Icons.money_off, isNumeric: true),
                ]),
                _buildTextField(_sueldoBaseController, 'Sueldo Base', Icons.attach_money, isNumeric: true),
                _buildRowFields([
                  _buildTextField(_bonoExtraordinarioController, 'Bono Extraordinario', Icons.card_giftcard, isNumeric: true),
                  _buildTextField(_adelantoController, 'Adelanto', Icons.money, isNumeric: true),
                  _buildTextField(_otrosDescuentosController, 'Otros Descuentos', Icons.remove_circle, isNumeric: true),
                ]),
                _buildTextField(_sueldoNetoController, 'Sueldo Neto', Icons.account_balance_wallet, isNumeric: true),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _limpiarCasillas();
          }
        },
        label: const Text('Guardar'),
        icon: const Icon(Icons.save),
        backgroundColor: Colors.green,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildFechaSelector() {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text(
          _fecha != null ? 'Fecha: ${_fecha!.toString().split(' ')[0]}' : 'Seleccionar Fecha',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: const Icon(Icons.date_range, color: Colors.blue),
        trailing: IconButton(
          icon: const Icon(Icons.calendar_today, color: Colors.blue),
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
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, IconData icon, {bool isNumeric = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextFormField(
        controller: controller,
        keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Campo requerido';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildRowFields(List<Widget> fields) {
    return Row(
      children: fields.map((field) => Expanded(child: Padding(padding: const EdgeInsets.all(4.0), child: field))).toList(),
    );
  }
}
