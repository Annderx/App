import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'entrada_provider.dart';
import 'ClasesEntrada.dart';

class InformeEntradas extends StatefulWidget {
  const InformeEntradas({Key? key}) : super(key: key);

  @override
  State<InformeEntradas> createState() => _InformeEntradasState();
}

class _InformeEntradasState extends State<InformeEntradas> {
  late Future<List<Entrada>> _entradasFuture;
  String _filtro = "";

  @override
  void initState() {
    super.initState();
    _cargarEntradas();
  }

  void _cargarEntradas() {
    final entradaProvider = Provider.of<EntradaProvider>(context, listen: false);
    setState(() {
      _entradasFuture = entradaProvider.obtenerEntradas();
    });
  }

  void _eliminarEntrada(String codigoEntrada) {
    final entradaProvider = Provider.of<EntradaProvider>(context, listen: false);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Eliminar Entrada'),
        content: const Text('¿Está seguro de que desea eliminar esta entrada?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              entradaProvider.eliminarEntrada(codigoEntrada);
              _cargarEntradas();
              Navigator.pop(context);
            },
            child: const Text('Eliminar', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Informe de Entradas')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Buscar Entrada',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onChanged: (value) {
                setState(() => _filtro = value.toLowerCase());
              },
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Entrada>>(
              future: _entradasFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Error al cargar entradas'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No hay entradas registradas'));
                }

                final entradasFiltradas = snapshot.data!.where((entrada) {
                  return entrada.descripcion.toLowerCase().contains(_filtro) ||
                         entrada.codigoEntrada.toLowerCase().contains(_filtro);
                }).toList();

                return ListView.builder(
                  itemCount: entradasFiltradas.length,
                  itemBuilder: (context, index) {
                    final entrada = entradasFiltradas[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Text(entrada.descripcion[0], style: const TextStyle(color: Colors.white)),
                        ),
                        title: Text('Entrada: ${entrada.descripcion}'),
                        subtitle: Text('Código: ${entrada.codigoEntrada}'),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _eliminarEntrada(entrada.codigoEntrada),
                        ),
                        onTap: () => _mostrarDetallesEntrada(context, entrada),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _mostrarDetallesEntrada(BuildContext context, Entrada entrada) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Detalles de ${entrada.descripcion}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Código: ${entrada.codigoEntrada}'),
            Text('Fecha: ${entrada.fecha?.toLocal().toString().split(' ')[0] ?? 'No especificada'}'),
            Text('Código Producto: ${entrada.codigoProducto}'),
            Text('Cantidad: ${entrada.cantidad}'),
            Text('Precio: ${entrada.precio}'),
            Text('Marca: ${entrada.marca}'),
            Text('Unidad: ${entrada.unidad}'),
            Text('Proveedor: ${entrada.proveedor}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cerrar'),
          ),
        ],
      ),
    );
  }
}
