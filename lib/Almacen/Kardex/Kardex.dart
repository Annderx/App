import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ClasesKardex.dart';
import 'kardex_provider.dart';

class KardexProductos extends StatefulWidget {
  const KardexProductos({super.key});

  @override
  State<KardexProductos> createState() => _KardexProductosState();
}

class _KardexProductosState extends State<KardexProductos> {
  final _formKey = GlobalKey<FormState>();
  final _tipoController = TextEditingController();
  DateTime? _fechaBusqueda;
  List<KardexEntry> _resultados = [];

  void _buscarPorFecha() {
    if (_fechaBusqueda != null) {
      final resultados =
          Provider.of<KardexProviderAlmacen>(context, listen: false)
              .filtrarPorFecha(_fechaBusqueda!);
      setState(() {
        _resultados = resultados;
      });
    }
  }

  void _buscarPorTipo() {
    final tipo = _tipoController.text;
    if (tipo.isNotEmpty) {
      final resultados =
          Provider.of<KardexProviderAlmacen>(context, listen: false).filtrarPorTipo(tipo);
      setState(() {
        _resultados = resultados;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kardex de Entrada y Salida de Productos'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    _fechaBusqueda != null
                        ? 'Fecha de búsqueda: ${_fechaBusqueda!.toString().split(' ')[0]}'
                        : 'Fecha de búsqueda: ',
                  ),
                  IconButton(
                    onPressed: () async {
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      if (picked != null && picked != _fechaBusqueda) {
                        setState(() {
                          _fechaBusqueda = picked;
                        });
                      }
                    },
                    icon: const Icon(Icons.calendar_today),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _buscarPorFecha,
                      child: const Text('BUSCAR POR FECHA'),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _buscarPorTipo,
                      child: const Text('BUSCAR POR TIPO'),
                    ),
                  ),
                ],
              ),
              TextFormField(
                controller: _tipoController,
                decoration: const InputDecoration(labelText: 'TIPO:'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Lógica para imprimir
                },
                child: const Text('IMPRIMIR'),
              ),
              // Mostrar resultados
              Expanded(
                child: ListView.builder(
                  itemCount: _resultados.length,
                  itemBuilder: (context, index) {
                    final entry = _resultados[index];
                    return ListTile(
                      title: Text(
                          '${entry.tipo}: ${entry.descripcionProducto}'),
                      subtitle: Text(
                          'Cantidad: ${entry.cantidad}, Fecha: ${entry.fecha.toString().split(' ')[0]}'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}