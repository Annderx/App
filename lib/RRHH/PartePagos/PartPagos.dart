import 'package:flutter/material.dart';

class RegistroPartePagoTrabajadores extends StatefulWidget {
  const RegistroPartePagoTrabajadores({super.key});

  @override
  _RegistroPartePagoTrabajadoresState createState() => _RegistroPartePagoTrabajadoresState();
}

class _RegistroPartePagoTrabajadoresState extends State<RegistroPartePagoTrabajadores> {
  final _formKey = GlobalKey<FormState>();
  final _colaboradorController = TextEditingController();
  final _saldoPagarController = TextEditingController();

  DateTime? _fecha;
  List<Map<String, dynamic>> pagos = [];

  void _agregarPago() {
    setState(() {
      pagos.add({
        'monto': TextEditingController(),
        'fecha': null,
        'formaPago': TextEditingController(),
        'observacion': TextEditingController(),
      });
    });
  }

  void _eliminarPago(int index) {
    setState(() {
      pagos.removeAt(index);
    });
  }

  void _limpiarCasillas() {
    _colaboradorController.clear();
    _saldoPagarController.clear();
    pagos.clear();
    _fecha = null;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Parte de Pago'),
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
                _buildTextField(_saldoPagarController, 'Saldo a Pagar', Icons.attach_money, isNumeric: true),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Pagos Parciales", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    ElevatedButton.icon(
                      onPressed: _agregarPago,
                      icon: const Icon(Icons.add),
                      label: const Text("Añadir Pago"),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                _buildPagosList(),
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

  Widget _buildPagosList() {
    return Column(
      children: pagos.asMap().entries.map((entry) {
        int index = entry.key;
        Map<String, dynamic> pago = entry.value;
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 6),
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _buildTextField(pago['monto'], 'Monto', Icons.attach_money, isNumeric: true),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _eliminarPago(index),
                    ),
                  ],
                ),
                ListTile(
                  leading: const Icon(Icons.date_range, color: Colors.blue),
                  title: Text(
                    pago['fecha'] != null ? 'Fecha: ${pago['fecha'].toString().split(' ')[0]}' : 'Seleccionar Fecha de Pago',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.calendar_today, color: Colors.blue),
                    onPressed: () async {
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      if (picked != null) {
                        setState(() {
                          pago['fecha'] = picked;
                        });
                      }
                    },
                  ),
                ),
                _buildTextField(pago['formaPago'], 'Forma de Pago', Icons.payment),
                _buildTextField(pago['observacion'], 'Observaciones', Icons.note),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
