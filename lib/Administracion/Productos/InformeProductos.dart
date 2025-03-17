import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'productos_provider.dart';

class InformeProductos extends StatelessWidget {
  const InformeProductos({super.key});

  @override
  Widget build(BuildContext context) {
    final productoProvider = Provider.of<ProductoProvider>(context);
    final productos = productoProvider.productos;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Informe de Productos'),
      ),
      body: ListView.builder(
        itemCount: productos.length,
        itemBuilder: (context, index) {
          final producto = productos[index];
          return ListTile(
            title: Text(producto.descripcion),
            subtitle: Text('Marca: ${producto.marca}, Cantidad: ${producto.cantidad}'),
            trailing: Text('Precio: ${producto.precio}'),
          );
        },
      ),
    );
  }
}