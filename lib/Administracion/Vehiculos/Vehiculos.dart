import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ClasesVehiculos.dart';
import 'vehiculos_provider.dart';

class RegistroVehiculos extends StatefulWidget {
  const RegistroVehiculos({super.key});

  @override
  State<RegistroVehiculos> createState() => _RegistroVehiculosState();
}

class _RegistroVehiculosState extends State<RegistroVehiculos> {
  final _formKey = GlobalKey<FormState>();
  final _codigoVehiculoController = TextEditingController();
  final _razonSocialController = TextEditingController();
  final _contactoController = TextEditingController();
  final _modeloController = TextEditingController();
  final _marcaController = TextEditingController();
  final _combustibleController = TextEditingController();
  final _tipoVehiculoController = TextEditingController();
  final _placaController = TextEditingController();
  final _anioFabricacionController = TextEditingController();
  final _anioModeloController = TextEditingController();
  final _nroMotorController = TextEditingController();
  final _vinController = TextEditingController();

  void _limpiarCasillas() {
    _codigoVehiculoController.clear();
    _razonSocialController.clear();
    _contactoController.clear();
    _modeloController.clear();
    _marcaController.clear();
    _combustibleController.clear();
    _tipoVehiculoController.clear();
    _placaController.clear();
    _anioFabricacionController.clear();
    _anioModeloController.clear();
    _nroMotorController.clear();
    _vinController.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro de Vehículos')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _codigoVehiculoController,
                decoration: InputDecoration(
                  // Removido 'const'
                  labelText: 'Código Vehículo',
                  icon: Icon(Icons.vpn_key), // Envuelto en Icon()
                ),
                enabled: false,
              ),
              TextFormField(
                controller: _razonSocialController,
                decoration: InputDecoration(
                  // Removido 'const'
                  labelText: 'Razón Social',
                  icon: Icon(Icons.business), // Envuelto en Icon()
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa la razón social';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _contactoController,
                decoration: InputDecoration(
                  // Removido 'const'
                  labelText: 'Contacto',
                  icon: Icon(Icons.person), // Envuelto en Icon()
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa el contacto';
                  }
                  return null;
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _modeloController,
                      decoration: InputDecoration(
                        // Removido 'const'
                        labelText: 'Modelo',
                        icon: Icon(Icons.directions_car), // Envuelto en Icon()
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, ingresa el modelo';
                        }
                        return null;
                      },
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _marcaController,
                      decoration: InputDecoration(
                        // Removido 'const'
                        labelText: 'Marca',
                        icon: Icon(
                          Icons.branding_watermark,
                        ), // Envuelto en Icon()
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, ingresa la marca';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _combustibleController,
                      decoration: InputDecoration(
                        // Removido 'const'
                        labelText: 'Combustible',
                        icon: Icon(
                          Icons.local_gas_station,
                        ), // Envuelto en Icon()
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, ingresa el combustible';
                        }
                        return null;
                      },
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _tipoVehiculoController,
                      decoration: InputDecoration(
                        // Removido 'const'
                        labelText: 'Tipo de Vehículo',
                        icon: Icon(Icons.category), // Envuelto en Icon()
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, ingresa el tipo de vehículo';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _placaController,
                      decoration: InputDecoration(
                        // Removido 'const'
                        labelText: 'Placa',
                        icon: Icon(Icons.directions_car), // Envuelto en Icon()
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, ingresa la placa';
                        }
                        return null;
                      },
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _anioFabricacionController,
                      decoration: InputDecoration(
                        // Removido 'const'
                        labelText: 'Año de Fabricación',
                        icon: Icon(Icons.calendar_today), // Envuelto en Icon()
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, ingresa el año de fabricación';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _anioModeloController,
                      decoration: InputDecoration(
                        // Removido 'const'
                        labelText: 'Año de Modelo',
                        icon: Icon(Icons.calendar_today), // Envuelto en Icon()
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, ingresa el año de modelo';
                        }
                        return null;
                      },
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _nroMotorController,
                      decoration: InputDecoration(
                        // Removido 'const'
                        labelText: 'N° de Motor',
                        icon: Icon(Icons.build), // Envuelto en Icon()
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, ingresa el número de motor';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              TextFormField(
                controller: _vinController,
                decoration: InputDecoration(
                  // Removido 'const'
                  labelText: 'VIN',
                  icon: Icon(Icons.confirmation_number), // Envuelto en Icon()
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa el VIN';
                  }
                  return null;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final vehiculo = Vehiculo(
                          id: DateTime.now().millisecondsSinceEpoch,
                          codigoVehiculo: _codigoVehiculoController.text,
                          razonSocial: _razonSocialController.text,
                          contacto: _contactoController.text,
                          modelo: _modeloController.text,
                          marca: _marcaController.text,
                          combustible: _combustibleController.text,
                          tipoVehiculo: _tipoVehiculoController.text,
                          placa: _placaController.text,
                          anioFabricacion: _anioFabricacionController.text,
                          anioModelo: _anioModeloController.text,
                          nroMotor: _nroMotorController.text,
                          vin: _vinController.text,
                        );
                        print('Vehículo a agregar: ${vehiculo.toJson()}');
                        Provider.of<VehiculoProvider>(
                          context,
                          listen: false,
                        ).agregarVehiculo(vehiculo);
                        _limpiarCasillas();
                      }
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.save),
                        const SizedBox(width: 8),
                        const Text('Guardar'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _limpiarCasillas,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.clear),
                        const SizedBox(width: 8),
                        const Text('Limpiar'),
                      ],
                    ),
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
