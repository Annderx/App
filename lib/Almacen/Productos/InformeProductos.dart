import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'productos_provider.dart';
import 'ClasesProductos.dart';

class InformeProductos extends StatelessWidget {
  const InformeProductos({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductoProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Informe de Productos')),
      body: ListView.builder(
        itemCount: provider.productos.length,
        itemBuilder: (context, index) {
          Producto producto = provider.productos[index];
          return ListTile(
            title: Text('Producto ${producto.codigoProducto}'),
            subtitle: Text(
                'Descripción: ${producto.descripcion}, Cantidad: ${producto.cantidad}'),
          );
        },
      ),
    );
  }
}