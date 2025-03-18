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

  void _buscarPorFecha() {
    if (_fechaInicio != null && _fechaFin != null) {
      _resultados = Provider.of<KardexProvider>(context, listen: false)
          .buscarPorFecha(_fechaInicio!, _fechaFin!);
      setState(() {});
    } else {
      _mostrarMensaje('Selecciona ambas fechas para buscar.');
    }
  }

  void _buscarPorTipo() {
    if (_tipo != null) {
      _resultados =
          Provider.of<KardexProvider>(context, listen: false).buscarPorTipo(_tipo!);
      setState(() {});
    } else {
      _mostrarMensaje('Selecciona un tipo de movimiento.');
    }
  }

  void _mostrarMensaje(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mensaje)),
    );
  }

  Future<void> _seleccionarFecha(BuildContext context, bool esInicio) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        esInicio ? _fechaInicio = picked : _fechaFin = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kardex de Productos')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Selección de fecha
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _botonFecha('Desde:', _fechaInicio, () => _seleccionarFecha(context, true)),
                  _botonFecha('Hasta:', _fechaFin, () => _seleccionarFecha(context, false)),
                ],
              ),
              const SizedBox(height: 20),

              // Filtro por tipo
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Tipo de Movimiento'),
                value: _tipo,
                items: ['Entrada', 'Salida']
                    .map((tipo) => DropdownMenuItem(value: tipo, child: Text(tipo)))
                    .toList(),
                onChanged: (value) => setState(() => _tipo = value),
              ),

              const SizedBox(height: 20),

              // Botones de búsqueda
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _botonAccion('Buscar por Fecha', Icons.calendar_today, _buscarPorFecha),
                  _botonAccion('Buscar por Tipo', Icons.filter_list, _buscarPorTipo),
                ],
              ),

              const SizedBox(height: 20),

              // Resultados de búsqueda
              _resultados.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _resultados.length,
                      itemBuilder: (context, index) {
                        final producto = _resultados[index];
                        return Card(
                          child: ListTile(
                            title: Text(producto.nombre),
                            subtitle: Text(
                                '${producto.tipo} - ${producto.fecha.toString().split(' ')[0]}'),
                            trailing: Text('Cantidad: ${producto.cantidad}'),
                          ),
                        );
                      },
                    )
                  : const Center(child: Text('No hay resultados')),

              const SizedBox(height: 20),

              // Botón de impresión
              Center(
                child: _botonAccion('Imprimir', Icons.print, () {
                  // Implementar impresión aquí
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔹 Widget reutilizable para seleccionar fechas
  Widget _botonFecha(String label, DateTime? fecha, VoidCallback onTap) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(fecha != null ? '$label ${fecha.toLocal()}'.split(' ')[0] : label),
      ),
    );
  }

  /// 🔹 Widget reutilizable para botones de acción
  Widget _botonAccion(String label, IconData icon, VoidCallback onPressed) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(label),
    );
  }
}
