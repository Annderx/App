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
  final _placaController = TextEditingController();
  final _anioFabricacionController = TextEditingController();
  final _anioModeloController = TextEditingController();
  final _nroMotorController = TextEditingController();
  final _vinController = TextEditingController();

  String? _combustibleSeleccionado;
  String? _tipoVehiculoSeleccionado;

  final List<String> _tiposCombustible = [
    'Gasolina',
    'Diésel',
    'Eléctrico',
    'Híbrido'
  ];
  final List<String> _tiposVehiculo = ['Sedán', 'SUV', 'Camión', 'Motocicleta'];

  void _limpiarCasillas() {
    _codigoVehiculoController.clear();
    _razonSocialController.clear();
    _contactoController.clear();
    _modeloController.clear();
    _marcaController.clear();
    _placaController.clear();
    _anioFabricacionController.clear();
    _anioModeloController.clear();
    _nroMotorController.clear();
    _vinController.clear();
    _combustibleSeleccionado = null;
    _tipoVehiculoSeleccionado = null;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                  decoration: const InputDecoration(
                    labelText: 'Código Vehículo',
                    icon: Icon(Icons.vpn_key),
                  ),
                  enabled: false,
                ),
                TextFormField(
                  controller: _razonSocialController,
                  decoration: const InputDecoration(
                    labelText: 'Razón Social',
                    icon: Icon(Icons.business),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? 'Ingrese la razón social' : null,
                ),
                TextFormField(
                  controller: _contactoController,
                  decoration: const InputDecoration(
                    labelText: 'Contacto',
                    icon: Icon(Icons.person),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? 'Ingrese el contacto' : null,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _modeloController,
                        decoration: const InputDecoration(
                          labelText: 'Modelo',
                          icon: Icon(Icons.directions_car),
                        ),
                        validator: (value) =>
                            value!.isEmpty ? 'Ingrese el modelo' : null,
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _marcaController,
                        decoration: const InputDecoration(
                          labelText: 'Marca',
                          icon: Icon(Icons.branding_watermark),
                        ),
                        validator: (value) =>
                            value!.isEmpty ? 'Ingrese la marca' : null,
                      ),
                    ),
                  ],
                ),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Combustible',
                    icon: Icon(Icons.local_gas_station),
                  ),
                  value: _combustibleSeleccionado,
                  items: _tiposCombustible.map((String tipo) {
                    return DropdownMenuItem<String>(
                      value: tipo,
                      child: Text(tipo),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _combustibleSeleccionado = value;
                    });
                  },
                ),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Tipo de Vehículo',
                    icon: Icon(Icons.category),
                  ),
                  value: _tipoVehiculoSeleccionado,
                  items: _tiposVehiculo.map((String tipo) {
                    return DropdownMenuItem<String>(
                      value: tipo,
                      child: Text(tipo),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _tipoVehiculoSeleccionado = value;
                    });
                  },
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _placaController,
                        decoration: const InputDecoration(
                          labelText: 'Placa',
                          icon: Icon(Icons.directions_car),
                        ),
                        validator: (value) =>
                            value!.isEmpty ? 'Ingrese la placa' : null,
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _anioFabricacionController,
                        decoration: const InputDecoration(
                          labelText: 'Año de Fabricación',
                          icon: Icon(Icons.calendar_today),
                        ),
                        validator: (value) =>
                            value!.isEmpty ? 'Ingrese el año' : null,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _anioModeloController,
                        decoration: const InputDecoration(
                          labelText: 'Año de Modelo',
                          icon: Icon(Icons.calendar_today),
                        ),
                        validator: (value) =>
                            value!.isEmpty ? 'Ingrese el año' : null,
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _nroMotorController,
                        decoration: const InputDecoration(
                          labelText: 'N° de Motor',
                          icon: Icon(Icons.build),
                        ),
                        validator: (value) => value!.isEmpty
                            ? 'Ingrese el número de motor'
                            : null,
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  controller: _vinController,
                  decoration: const InputDecoration(
                    labelText: 'VIN',
                    icon: Icon(Icons.confirmation_number),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? 'Ingrese el VIN' : null,
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
                            combustible: _combustibleSeleccionado!,
                            tipoVehiculo: _tipoVehiculoSeleccionado!,
                            placa: _placaController.text,
                            anioFabricacion:
                                int.tryParse(_anioFabricacionController.text) ??
                                    0, // Conversión segura
                            anioModelo:
                                int.tryParse(_anioModeloController.text) ??
                                    0, // Conversión segura
                            nroMotor: _nroMotorController.text,
                            vin: _vinController.text,
                          );

                          Provider.of<VehiculoProvider>(context, listen: false)
                              .agregarVehiculo(vehiculo);
                          _limpiarCasillas();
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
