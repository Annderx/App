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

  @override
  void dispose() {
    _tipoController.dispose();
    super.dispose();
  }

  void _buscarPorFecha() {
    if (_fechaBusqueda != null) {
      setState(() {
        _resultados = Provider.of<KardexProviderAlmacen>(context, listen: false)
            .filtrarPorFecha(_fechaBusqueda!);
      });
    }
  }

  void _buscarPorTipo() {
    final tipo = _tipoController.text.trim();
    if (tipo.isNotEmpty) {
      setState(() {
        _resultados = Provider.of<KardexProviderAlmacen>(context, listen: false)
            .filtrarPorTipo(tipo);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kardex de Productos')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildDatePicker(),
              _buildRow([
                _buildButton('Buscar por Fecha', _buscarPorFecha),
                _buildButton('Buscar por Tipo', _buscarPorTipo),
              ]),
              _buildTextField(_tipoController, 'Tipo'),
              _buildButton('Imprimir', () {/* Lógica para imprimir */}),
              Expanded(child: _buildResultList()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDatePicker() {
    return Row(
      children: [
        Text(
          _fechaBusqueda != null
              ? 'Fecha: ${_fechaBusqueda!.toString().split(' ')[0]}'
              : 'Fecha:',
        ),
        IconButton(
          onPressed: () async {
            final picked = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );
            if (picked != null) {
              setState(() => _fechaBusqueda = picked);
            }
          },
          icon: const Icon(Icons.calendar_today),
        ),
      ],
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(labelText: label),
      ),
    );
  }

  Widget _buildButton(String text, VoidCallback onPressed) {
    return Expanded(
      child: ElevatedButton(onPressed: onPressed, child: Text(text)),
    );
  }

  Widget _buildRow(List<Widget> children) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: children.map((e) => Expanded(child: e)).toList(),
    );
  }

  Widget _buildResultList() {
    return _resultados.isEmpty
        ? const Center(child: Text('No hay resultados'))
        : ListView.builder(
            itemCount: _resultados.length,
            itemBuilder: (context, index) {
              final entry = _resultados[index];
              return ListTile(
                title: Text('${entry.tipo}: ${entry.descripcionProducto}'),
                subtitle: Text(
                    'Cantidad: ${entry.cantidad}, Fecha: ${entry.fecha.toString().split(' ')[0]}'),
              );
            },
          );
  }
}
