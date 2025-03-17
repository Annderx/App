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

  final _codigoProductoController = TextEditingController();
  final _descripcionController = TextEditingController();
  final _marcaController = TextEditingController();
  final _ubicacionController = TextEditingController();
  final _objetivoController = TextEditingController();
  final _cantidadController = TextEditingController();
  final _categoriaController = TextEditingController();
  final _unidadController = TextEditingController();
  final _precioController = TextEditingController();
  final _detalleMedidaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _cargarDatos();
  }

  Future<void> _cargarDatos() async {
    setState(() {});
  }

  void _limpiarCasillas() {
    _codigoProductoController.clear();
    _descripcionController.clear();
    _marcaController.clear();
    _ubicacionController.clear();
    _objetivoController.clear();
    _cantidadController.clear();
    _categoriaController.clear();
    _unidadController.clear();
    _precioController.clear();
    _detalleMedidaController.clear();
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
              TextFormField(
                controller: _codigoProductoController,
                decoration: const InputDecoration(labelText: 'CODIGO PRODUCTO:'),
                enabled: false,
              ),
              TextFormField(
                controller: _descripcionController,
                decoration: const InputDecoration(labelText: 'DESCRIPCION:'),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _marcaController,
                      decoration: const InputDecoration(labelText: 'MARCA:'),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _ubicacionController,
                      decoration: const InputDecoration(labelText: 'UBICACION:'),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _objetivoController,
                      decoration: const InputDecoration(labelText: 'OBJETIVO:'),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _cantidadController,
                      decoration: const InputDecoration(labelText: 'CANTIDAD:'),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _categoriaController,
                      decoration: const InputDecoration(labelText: 'CATEGORIA:'),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _unidadController,
                      decoration: const InputDecoration(labelText: 'UNIDAD:'),
                    ),
                  ),
                ],
              ),
              TextFormField(
                controller: _precioController,
                decoration: const InputDecoration(labelText: 'PRECIO:'),
              ),
              TextFormField(
                controller: _detalleMedidaController,
                decoration: const InputDecoration(labelText: 'DETALLE DE MEDIDA:'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final producto = Producto(
                          codigoProducto: int.tryParse(_codigoProductoController.text) ?? 0,
                          descripcion: _descripcionController.text,
                          marca: _marcaController.text,
                          ubicacion: _ubicacionController.text,
                          objetivo: _objetivoController.text,
                          cantidad: int.tryParse(_cantidadController.text) ?? 0,
                          categoria: _categoriaController.text,
                          unidad: _unidadController.text,
                          precio: double.tryParse(_precioController.text) ?? 0.0,
                          detalleMedida: _detalleMedidaController.text,
                        );
                        Provider.of<ProductoProvider>(context, listen: false)
                            .agregarProducto(producto);
                      }
                    },
                    child: const Text('GUARDAR'),
                  ),
                  ElevatedButton(
                    onPressed: _limpiarCasillas,
                    child: const Text('LIMPIAR'),
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