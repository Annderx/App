import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'salida_provider.dart';
import 'ClasesSalida.dart';

class InformeSalidas extends StatefulWidget {
  const InformeSalidas({Key? key}) : super(key: key);

  @override
  State<InformeSalidas> createState() => _InformeSalidasState();
}

class _InformeSalidasState extends State<InformeSalidas> {
  late Future<List<Salida>> _salidasFuture;
  String _filtro = "";

  @override
  void initState() {
    super.initState();
    _cargarSalidas();
  }

  void _cargarSalidas() {
    final salidaProvider = Provider.of<SalidaProvider>(context, listen: false);
    setState(() {
      _salidasFuture = salidaProvider.obtenerSalidas();
    });
  }

  void _eliminarSalida(String codigoSalida) {
    final salidaProvider = Provider.of<SalidaProvider>(context, listen: false);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Eliminar Salida'),
        content: const Text('¿Está seguro de que desea eliminar esta salida?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              salidaProvider.eliminarSalida(codigoSalida);
              _cargarSalidas();
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
      appBar: AppBar(title: const Text('Informe de Salidas')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Buscar Salida',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onChanged: (value) {
                setState(() => _filtro = value.toLowerCase());
              },
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Salida>>(
              future: _salidasFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Error al cargar salidas'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No hay salidas registradas'));
                }

                final salidasFiltradas = snapshot.data!.where((salida) {
                  return salida.descripcion.toLowerCase().contains(_filtro) ||
                         salida.codigoSalida.toLowerCase().contains(_filtro);
                }).toList();

                return ListView.builder(
                  itemCount: salidasFiltradas.length,
                  itemBuilder: (context, index) {
                    final salida = salidasFiltradas[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Text(salida.descripcion[0], style: const TextStyle(color: Colors.white)),
                        ),
                        title: Text('Salida: ${salida.descripcion}'),
                        subtitle: Text('Código: ${salida.codigoSalida}'),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _eliminarSalida(salida.codigoSalida),
                        ),
                        onTap: () => _mostrarDetallesSalida(context, salida),
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

  void _mostrarDetallesSalida(BuildContext context, Salida salida) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Detalles de ${salida.descripcion}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Código: ${salida.codigoSalida}'),
            Text('Fecha: ${salida.fecha?.toLocal().toString().split(' ')[0] ?? 'No especificada'}'),
            Text('Código Producto: ${salida.codigoProducto}'),
            Text('Cantidad: ${salida.cantidad}'),
            Text('Precio: ${salida.precio}'),
            Text('Marca: ${salida.marca}'),
            Text('Unidad: ${salida.unidad}'),
            Text('Empleado: ${salida.empleado}'),
            Text('Cliente: ${salida.cliente}'),
            Text('Ubicación: ${salida.ubicacion}'),
            Text('Estado: ${salida.estado}'),
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
