import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cobrar_provider.dart';
import 'FacturasCobrar.dart';

class RegistroCobrarFacturas extends StatefulWidget {
  const RegistroCobrarFacturas({super.key});

  @override
  State<RegistroCobrarFacturas> createState() => _RegistroCobrarFacturasState();
}

class _RegistroCobrarFacturasState extends State<RegistroCobrarFacturas> {
  final _formKey = GlobalKey<FormState>();
  final _nroFacturaController = TextEditingController();
  final _proveedorController = TextEditingController();
  final _montoController = TextEditingController();
  final _formaPagoController = TextEditingController();
  final _acuenta1Controller = TextEditingController();
  final _acuenta2Controller = TextEditingController();
  final _acuenta3Controller = TextEditingController();
  DateTime? _fecha;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Pagos Facturas por Cobrar'),
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
                  Expanded(
                    child: TextFormField(
                      controller: _nroFacturaController,
                      decoration: const InputDecoration(
                        labelText: 'N° Factura',
                        icon: Icon(Icons.receipt_long),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Total',
                        icon: Icon(Icons.attach_money),
                      ),
                    ),
                  ),
                ],
              ),
              TextFormField(
                controller: _proveedorController,
                decoration: const InputDecoration(
                  labelText: 'Proveedor',
                  icon: Icon(Icons.business),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _montoController,
                      decoration: const InputDecoration(
                        labelText: 'Monto',
                        icon: Icon(Icons.money),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _formaPagoController,
                      decoration: const InputDecoration(
                        labelText: 'Forma de Pago',
                        icon: Icon(Icons.payment),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
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
                  ),
                ],
              ),
              TextFormField(
                controller: _acuenta1Controller,
                decoration: const InputDecoration(
                  labelText: 'Acuenta 1',
                  icon: Icon(Icons.account_balance),
                ),
              ),
              TextFormField(
                controller: _acuenta2Controller,
                decoration: const InputDecoration(
                  labelText: 'Acuenta 2',
                  icon: Icon(Icons.account_balance),
                ),
              ),
              TextFormField(
                controller: _acuenta3Controller,
                decoration: const InputDecoration(
                  labelText: 'Acuenta 3',
                  icon: Icon(Icons.account_balance),
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Saldo a Pagar',
                  icon: Icon(Icons.money_off),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final factura = FacturaCobrar(
                        nroFactura: _nroFacturaController.text,
                        proveedor: _proveedorController.text,
                        monto: double.parse(_montoController.text),
                        formaPago: _formaPagoController.text,
                        fecha: _fecha!,
                        acuenta1: double.parse(_acuenta1Controller.text),
                        acuenta2: double.parse(_acuenta2Controller.text),
                        acuenta3: double.parse(_acuenta3Controller.text),
                      );
                      Provider.of<FacturaCobrarProvider>(context, listen: false)
                          .agregarFactura(factura);
                      _formKey.currentState!.reset();
                      _fecha = null;
                      setState(() {});
                    }
                  },
                  child: Row( // Corrección aquí
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.save),
                      const SizedBox(width: 8),
                      const Text('Actualizar'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}