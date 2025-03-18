import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'productos_provider.dart';
import 'ClasesProductos.dart';

class InformeProductos extends StatefulWidget {
  const InformeProductos({super.key});

  @override
  _InformeProductosState createState() => _InformeProductosState();
}

class _InformeProductosState extends State<InformeProductos> {
  String _busqueda = "";

  @override
  Widget build(BuildContext context) {
    final productoProvider = Provider.of<ProductoProvider>(context);
    final productos = productoProvider.productos;

    // Filtrar productos según la búsqueda
    final productosFiltrados = productos.where((producto) {
      return producto.descripcion.toLowerCase().contains(_busqueda.toLowerCase()) ||
             producto.marca.toLowerCase().contains(_busqueda.toLowerCase()) ||
             producto.codigoProducto.toLowerCase().contains(_busqueda.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Informe de Productos'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Buscar producto...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (valor) {
                setState(() {
                  _busqueda = valor;
                });
              },
            ),
          ),
          Expanded(
            child: productosFiltrados.isEmpty
                ? const Center(child: Text('No hay productos disponibles'))
                : ListView.builder(
                    itemCount: productosFiltrados.length,
                    itemBuilder: (context, index) {
                      final producto = productosFiltrados[index];
                      return Card(
                        elevation: 3,
                        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: ListTile(
                          title: Text(producto.descripcion, style: const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text('Marca: ${producto.marca}, Cantidad: ${producto.cantidad}'),
                          trailing: Text('S/. ${producto.precio.toStringAsFixed(2)}', 
                            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
                          ),
                          onTap: () => _mostrarDetallesProducto(context, producto),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  void _mostrarDetallesProducto(BuildContext context, Producto producto) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('Detalles de ${producto.descripcion}'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Código: ${producto.codigoProducto}'),
              Text('Marca: ${producto.marca}'),
              Text('Categoría: ${producto.categoria}'),
              Text('Cantidad: ${producto.cantidad}'),
              Text('Precio: S/. ${producto.precio.toStringAsFixed(2)}'),
              Text('Ubicación: ${producto.ubicacion}'),
              Text('Objetivo: ${producto.objetivo}'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cerrar'),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
