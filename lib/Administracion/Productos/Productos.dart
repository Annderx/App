import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ClasesProductos.dart';
import 'productos_provider.dart';

class RegistroProductos extends StatefulWidget {
  const RegistroProductos({super.key});

  @override
  State<RegistroProductos> createState() => _RegistroProductosState();
}

class _RegistroProductosState extends State<RegistroProductos> {
  final _formKey = GlobalKey<FormState>();

  // Controladores para los campos de texto
  final _codigoProductoController = TextEditingController();
  final _descripcionController = TextEditingController();
  final _marcaController = TextEditingController();
  final _objetivoController = TextEditingController();
  final _cantidadController = TextEditingController();
  final _categoriaController = TextEditingController();
  final _unidadController = TextEditingController();
  final _precioController = TextEditingController();
  final _detalleMedidaController = TextEditingController();
  final _referenciaController = TextEditingController();
  final _ubicacionController = TextEditingController();

  void _limpiarCasillas() {
    _codigoProductoController.clear();
    _descripcionController.clear();
    _marcaController.clear();
    _objetivoController.clear();
    _cantidadController.clear();
    _categoriaController.clear();
    _unidadController.clear();
    _precioController.clear();
    _detalleMedidaController.clear();
    _referenciaController.clear();
    _ubicacionController.clear();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Productos'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Código de producto y descripción en la misma línea
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _codigoProductoController,
                      decoration: const InputDecoration(
                        labelText: 'Código Producto',
                        icon: Icon(Icons.qr_code),
                      ),
                      enabled: false,
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _descripcionController,
                      decoration: const InputDecoration(
                        labelText: 'Descripción',
                        icon: Icon(Icons.description),
                      ),
                    ),
                  ),
                ],
              ),
              // Marca y ubicación en la misma línea
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _marcaController,
                      decoration: const InputDecoration(
                        labelText: 'Marca',
                        icon: Icon(Icons.branding_watermark),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _ubicacionController,
                      decoration: const InputDecoration(
                        labelText: 'Ubicación',
                        icon: Icon(Icons.location_on),
                      ),
                    ),
                  ),
                ],
              ),
              // Objetivo y cantidad en la misma línea
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _objetivoController,
                      decoration: const InputDecoration(
                        labelText: 'Objetivo',
                        icon: Icon(Icons.flag),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _cantidadController,
                      decoration: const InputDecoration(
                        labelText: 'Cantidad',
                        icon: Icon(Icons.format_list_numbered),
                      ),
                    ),
                  ),
                ],
              ),
              // Categoría y unidad en la misma línea
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _categoriaController,
                      decoration: const InputDecoration(
                        labelText: 'Categoría',
                        icon: Icon(Icons.category),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _unidadController,
                      decoration: const InputDecoration(
                        labelText: 'Unidad',
                        icon: Icon(Icons.straighten),
                      ),
                    ),
                  ),
                ],
              ),
              // Precio y detalle de medida en la misma línea
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _precioController,
                      decoration: const InputDecoration(
                        labelText: 'Precio',
                        icon: Icon(Icons.attach_money),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _detalleMedidaController,
                      decoration: const InputDecoration(
                        labelText: 'Detalle de Medida',
                        icon: Icon(Icons.info_outline),
                      ),
                    ),
                  ),
                ],
              ),
              // Referencia
              TextFormField(
                controller: _referenciaController,
                decoration: const InputDecoration(
                  labelText: 'Referencia',
                  icon: Icon(Icons.link),
                ),
              ),
              // Botones en la misma línea
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final producto = Producto(
                          id: DateTime.now().millisecondsSinceEpoch,
                          codigoProducto: _codigoProductoController.text,
                          descripcion: _descripcionController.text,
                          marca: _marcaController.text,
                          objetivo: _objetivoController.text,
                          cantidad: int.parse(_cantidadController.text),
                          categoria: _categoriaController.text,
                          unidad: _unidadController.text,
                          precio: double.parse(_precioController.text),
                          detalleMedida: _detalleMedidaController.text,
                          referencia: _referenciaController.text,
                          ubicacion: _ubicacionController.text,
                        );
                        Provider.of<ProductoProvider>(context, listen: false)
                            .agregarProducto(producto);
                        _limpiarCasillas();
                      }
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.save),
                        const SizedBox(width: 8),
                        const Text('Guardar'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _limpiarCasillas,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.clear),
                        const SizedBox(width: 8),
                        const Text('Limpiar'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}