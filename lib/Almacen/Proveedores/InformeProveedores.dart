import 'package:flutter/material.dart';
import 'package:myapp/Almacen/Proveedores/ClasesProveedores.dart';
import 'package:provider/provider.dart';
import 'proveedores_provider.dart';

class InformeProveedores extends StatelessWidget {
  const InformeProveedores({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProveedorProviderAlmacen>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Informe de Proveedores')),
      body: ListView.builder(
        itemCount: provider.proveedores.length,
        itemBuilder: (context, index) {
          Proveedor proveedor = provider.proveedores[index];
          return ListTile(
            title: Text('Proveedor ${proveedor.razonSocial}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Código: ${proveedor.codigoProveedor}'),
                Text('Identificación: ${proveedor.noIdentificacion}'),
                Text('Teléfono: ${proveedor.telefono}'),
                Text('Correo: ${proveedor.correo}'),
                // Agrega más detalles si es necesario
              ],
            ),
          );
        },
      ),
    );
  }
}