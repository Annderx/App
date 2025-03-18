import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'vehiculos_provider.dart';

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
      body: vehiculos.isEmpty
          ? const Center(
              child: Text(
                'No hay vehículos registrados.',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
          : ListView.separated(
              itemCount: vehiculos.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final vehiculo = vehiculos[index];
                return ListTile(
                  leading: const Icon(Icons.directions_car, color: Colors.blue),
                  title: Text(
                    '${vehiculo.marca} ${vehiculo.modelo}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Placa: ${vehiculo.placa}\nVIN: ${vehiculo.vin}',
                    style: const TextStyle(fontSize: 14),
                  ),
                  trailing: Text(
                    'Año: ${vehiculo.anioModelo}',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                );
              },
            ),
    );
  }
}
