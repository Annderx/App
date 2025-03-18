import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pagar_provider.dart';
import 'FacturasPagar.dart';

class RegistroPagarFacturas extends StatefulWidget {
  const RegistroPagarFacturas({super.key});

  @override
  State<RegistroPagarFacturas> createState() => _RegistroPagarFacturasState();
}

class _RegistroPagarFacturasState extends State<RegistroPagarFacturas> {
  final _formKey = GlobalKey<FormState>();

  final _nroFacturaController = TextEditingController();
  final _proveedorController = TextEditingController();
  final _montoController = TextEditingController();
  final _formaPagoController = TextEditingController();
  final _acuenta1Controller = TextEditingController(text: '0.0');
  final _acuenta2Controller = TextEditingController(text: '0.0');
  final _acuenta3Controller = TextEditingController(text: '0.0');
  final _saldoController = TextEditingController();

  DateTime? _fecha;

  @override
  void dispose() {
    _nroFacturaController.dispose();
    _proveedorController.dispose();
    _montoController.dispose();
    _formaPagoController.dispose();
    _acuenta1Controller.dispose();
    _acuenta2Controller.dispose();
    _acuenta3Controller.dispose();
    _saldoController.dispose();
    super.dispose();
  }

  void _calcularSaldo() {
    double total = double.tryParse(_montoController.text) ?? 0.0;
    double acuenta1 = double.tryParse(_acuenta1Controller.text) ?? 0.0;
    double acuenta2 = double.tryParse(_acuenta2Controller.text) ?? 0.0;
    double acuenta3 = double.tryParse(_acuenta3Controller.text) ?? 0.0;
    double saldo = total - (acuenta1 + acuenta2 + acuenta3);
    _saldoController.text = saldo.toStringAsFixed(2);
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {bool isNumeric = false, IconData? icon, Function(String)? onChanged}) {
    return TextFormField(
      controller: controller,
      keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        icon: icon != null ? Icon(icon) : null,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) return 'Ingrese $label';
        if (isNumeric && double.tryParse(value) == null) return 'Ingrese un número válido';
        return null;
      },
      onChanged: onChanged,
    );
  }

  Widget _buildFechaSelector() {
    return Row(
      children: [
        Icon(Icons.calendar_today, color: Colors.blue),
        const SizedBox(width: 10),
        Text(
          _fecha != null ? 'Fecha: ${_fecha!.toLocal().toString().split(' ')[0]}' : 'Fecha: ',
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
              setState(() => _fecha = picked);
            }
          },
          icon: const Icon(Icons.edit_calendar, color: Colors.blue),
        ),
      ],
    );
  }

  void _guardarFactura() {
    if (!_formKey.currentState!.validate()) return;

    final factura = FacturaPagar(
      nroFactura: _nroFacturaController.text,
      proveedor: _proveedorController.text,
      monto: double.parse(_montoController.text),
      formaPago: _formaPagoController.text,
      fecha: _fecha!,
      acuenta1: double.parse(_acuenta1Controller.text),
      acuenta2: double.parse(_acuenta2Controller.text),
      acuenta3: double.parse(_acuenta3Controller.text),
    );

    Provider.of<FacturaPagarProvider>(context, listen: false).agregarFactura(factura);

    _mostrarMensaje('Factura agregada con éxito');
    _formKey.currentState!.reset();
    _fecha = null;
    setState(() {});
  }

  void _mostrarMensaje(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(mensaje)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro de Pagos Facturas por Pagar')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: _buildTextField('N° Factura', _nroFacturaController, icon: Icons.receipt)),
                  const SizedBox(width: 10),
                  Expanded(child: _buildTextField('Monto Total', _montoController, isNumeric: true, icon: Icons.attach_money, onChanged: (_) => _calcularSaldo())),
                ],
              ),
              _buildTextField('Proveedor', _proveedorController, icon: Icons.business),
              Row(
                children: [
                  Expanded(child: _buildTextField('Forma de Pago', _formaPagoController, icon: Icons.payment)),
                  const SizedBox(width: 10),
                  Expanded(child: _buildFechaSelector()),
                ],
              ),
              _buildTextField('Acuenta 1', _acuenta1Controller, isNumeric: true, icon: Icons.money, onChanged: (_) => _calcularSaldo()),
              _buildTextField('Acuenta 2', _acuenta2Controller, isNumeric: true, icon: Icons.money, onChanged: (_) => _calcularSaldo()),
              _buildTextField('Acuenta 3', _acuenta3Controller, isNumeric: true, icon: Icons.money, onChanged: (_) => _calcularSaldo()),
              _buildTextField('Saldo a Pagar', _saldoController, isNumeric: true, icon: Icons.money_off),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _guardarFactura,
                icon: const Icon(Icons.save),
                label: const Text('Guardar Factura'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
