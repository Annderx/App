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
  DateTime? _fecha;
  final _acuenta1Controller = TextEditingController();
  final _acuenta2Controller = TextEditingController();
  final _acuenta3Controller = TextEditingController();

  void _mostrarMensaje(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mensaje)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Pagos Facturas por Pagar'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nroFacturaController,
                decoration: const InputDecoration(
                  labelText: 'N° Factura',
                  icon: Icon(Icons.receipt),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese el número de factura';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _proveedorController,
                decoration: const InputDecoration(
                  labelText: 'Proveedor',
                  icon: Icon(Icons.business),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese el nombre del proveedor';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _montoController,
                decoration: const InputDecoration(
                  labelText: 'Monto',
                  icon: Icon(Icons.attach_money),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese el monto';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Por favor, ingrese un número válido';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _formaPagoController,
                decoration: const InputDecoration(
                  labelText: 'Forma de Pago',
                  icon: Icon(Icons.payment),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese la forma de pago';
                  }
                  return null;
                },
              ),
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
                controller: _acuenta1Controller,
                decoration: const InputDecoration(
                  labelText: 'Acuenta 1',
                  icon: Icon(Icons.money),
                ),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _acuenta2Controller,
                decoration: const InputDecoration(
                  labelText: 'Acuenta 2',
                  icon: Icon(Icons.money),
                ),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _acuenta3Controller,
                decoration: const InputDecoration(
                  labelText: 'Acuenta 3',
                  icon: Icon(Icons.money),
                ),
                keyboardType: TextInputType.number,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final factura = FacturaPagar(
                        nroFactura: _nroFacturaController.text,
                        proveedor: _proveedorController.text,
                        monto: double.parse(_montoController.text),
                        formaPago: _formaPagoController.text,
                        fecha: _fecha!,
                        acuenta1: double.tryParse(_acuenta1Controller.text) ?? 0,
                        acuenta2: double.tryParse(_acuenta2Controller.text) ?? 0,
                        acuenta3: double.tryParse(_acuenta3Controller.text) ?? 0,
                      );
                      Provider.of<FacturaPagarProvider>(context, listen: false)
                          .agregarFactura(factura);
                      _formKey.currentState!.reset();
                      _fecha = null;
                      setState(() {});
                      _mostrarMensaje('Factura agregada con éxito');
                    }
                  },
                  child: const Text('Actualizar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}