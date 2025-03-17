import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ClasesKardex.dart';
import 'kardex_provider.dart';

class KardexEntradaSalida extends StatefulWidget {
  const KardexEntradaSalida({super.key});

  @override
  State<KardexEntradaSalida> createState() => _KardexEntradaSalidaState();
}

class _KardexEntradaSalidaState extends State<KardexEntradaSalida> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _fechaInicio;
  DateTime? _fechaFin;
  String? _tipo;
  List<Producto> _resultados = [];

  Future<void> _buscarPorFecha() async {
    if (_fechaInicio != null && _fechaFin != null) {
      _resultados = Provider.of<KardexProvider>(context, listen: false)
          .buscarPorFecha(_fechaInicio!, _fechaFin!);
      setState(() {});
    }
  }

  Future<void> _buscarPorTipo() async {
    if (_tipo != null) {
      _resultados = Provider.of<KardexProvider>(context, listen: false)
          .buscarPorTipo(_tipo!);
      setState(() {});
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
              // ... (campos de fecha y tipo)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: _buscarPorFecha,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.calendar_today), // Icono para buscar por fecha
                        const SizedBox(width: 8),
                        const Text('Buscar por Fecha'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _buscarPorTipo,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.filter_list), // Icono para buscar por tipo
                        const SizedBox(width: 8),
                        const Text('Buscar por Tipo'),
                      ],
                    ),
                  ),
                ],
              ),
              // Mostrar resultados
              _resultados.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _resultados.length,
                      itemBuilder: (context, index) {
                        final producto = _resultados[index];
                        return ListTile(
                          title: Text(producto.nombre),
                          subtitle: Text(
                              '${producto.tipo} - ${producto.fecha.toString().split(' ')[0]}'),
                          trailing: Text('Cantidad: ${producto.cantidad}'),
                        );
                      },
                    )
                  : const Center(child: Text('No hay resultados')),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Lógica para imprimir
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.print), // Icono para imprimir
                      const SizedBox(width: 8),
                      const Text('Imprimir'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}