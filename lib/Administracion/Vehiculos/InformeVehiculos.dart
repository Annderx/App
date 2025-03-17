import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'vehiculos_provider.dart'; // Asegúrate de que la ruta sea correcta

class InformeVehiculos extends StatelessWidget {
  const InformeVehiculos({super.key});

  @override
  Widget build(BuildContext context) {
    final vehiculoProvider = Provider.of<VehiculoProvider>(context);
    final vehiculos = vehiculoProvider.vehiculos;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Informe de Vehículos'),
      ),
      body: ListView.builder(
        itemCount: vehiculos.length,
        itemBuilder: (context, index) {
          final vehiculo = vehiculos[index];
          return ListTile(
            title: Text('${vehiculo.marca} ${vehiculo.modelo}'),
            subtitle: Text('Placa: ${vehiculo.placa}, VIN: ${vehiculo.vin}'),
            trailing: Text('Año: ${vehiculo.anioModelo}'),
          );
        },
      ),
    );
  }
}