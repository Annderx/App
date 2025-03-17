import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'prestamos_provider.dart';
import 'package:myapp/Almacen/Prestamos/ClasesPrestamos.dart';

class InformePrestamos extends StatelessWidget {
  const InformePrestamos({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PrestamoProviderAlmacen>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Informe de Préstamos')),
      body: ListView.builder(
        itemCount: provider.prestamos.length,
        itemBuilder: (context, index) {
          PrestamoProducto prestamo = provider.prestamos[index];
          return ListTile(
            title: Text('Préstamo ${prestamo.codigoPrestamo}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Producto: ${prestamo.nombre}'),
                Text('Cantidad: ${prestamo.cantidad}'),
                Text('Prestatario: ${prestamo.prestatario}'),
                Text(
                    'Fecha de Préstamo: ${prestamo.fechaPrestamo.toString().split(' ')[0]}'),
                Text(prestamo.fechaDevolucion != null
                    ? 'Fecha de Devolución: ${prestamo.fechaDevolucion.toString().split(' ')[0]}'
                    : 'Fecha de Devolución: Pendiente'),
              ],
            ),
          );
        },
      ),
    );
  }
}