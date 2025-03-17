import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ClasesProveedores.dart';
import 'proveedores_provider.dart';

class RegistroProveedores extends StatefulWidget {
  const RegistroProveedores({super.key});

  @override
  State<RegistroProveedores> createState() => _RegistroProveedoresState();
}

class _RegistroProveedoresState extends State<RegistroProveedores> {
  final _formKey = GlobalKey<FormState>();

  final _codigoProveedorController = TextEditingController();
  final _razonSocialController = TextEditingController();
  final _noIdentificacionController = TextEditingController();
  final _direccionController = TextEditingController();
  final _metodoPagoController = TextEditingController();
  final _categoriaController = TextEditingController();
  final _telefonoController = TextEditingController();
  final _creditoController = TextEditingController();
  final _correoController = TextEditingController();
  final _notasController = TextEditingController();
  final _contacto1NombreController = TextEditingController();
  final _contacto1CorreoController = TextEditingController();
  final _contacto1CelularController = TextEditingController();
  final _contacto2NombreController = TextEditingController();
  final _contacto2CorreoController = TextEditingController();
  final _contacto2CelularController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _cargarDatos();
  }

  Future<void> _cargarDatos() async {
    setState(() {});
  }

  void _limpiarCasillas() {
    _codigoProveedorController.clear();
    _razonSocialController.clear();
    _noIdentificacionController.clear();
    _direccionController.clear();
    _metodoPagoController.clear();
    _categoriaController.clear();
    _telefonoController.clear();
    _creditoController.clear();
    _correoController.clear();
    _notasController.clear();
    _contacto1NombreController.clear();
    _contacto1CorreoController.clear();
    _contacto1CelularController.clear();
    _contacto2NombreController.clear();
    _contacto2CorreoController.clear();
    _contacto2CelularController.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Proveedores'),
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
                  Expanded(
                    child: TextFormField(
                      controller: _codigoProveedorController,
                      decoration: const InputDecoration(labelText: 'CODIGO PROVEEDOR:'),
                      enabled: false,
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _razonSocialController,
                      decoration: const InputDecoration(labelText: 'RAZON SOCIAL:'),
                    ),
                  ),
                  const Expanded(
                    child: Text('Nº CONTACTOS:'),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('1 CONTACTO'),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('2 CONTACTO'),
                    ),
                  ),
                ],
              ),
              TextFormField(
                controller: _noIdentificacionController,
                decoration: const InputDecoration(labelText: 'NO IDENTIFICACION:'),
              ),
              TextFormField(
                controller: _direccionController,
                decoration: const InputDecoration(labelText: 'DIRECCION:'),
              ),
              TextFormField(
                controller: _metodoPagoController,
                decoration: const InputDecoration(labelText: 'METODO DE PAGO:'),
              ),
              TextFormField(
                controller: _categoriaController,
                decoration: const InputDecoration(labelText: 'CATEGORIA:'),
              ),
              TextFormField(
                controller: _telefonoController,
                decoration: const InputDecoration(labelText: 'TELEFONO:'),
              ),
              TextFormField(
                controller: _creditoController,
                decoration: const InputDecoration(labelText: 'CREDITO:'),
              ),
              TextFormField(
                controller: _correoController,
                decoration: const InputDecoration(labelText: 'CORREO:'),
              ),
              TextFormField(
                controller: _notasController,
                decoration: const InputDecoration(labelText: 'NOTAS:'),
              ),
              const Text('CONTACTO 1'),
              TextFormField(
                controller: _contacto1NombreController,
                decoration: const InputDecoration(labelText: 'CONTACTO:'),
              ),
              TextFormField(
                controller: _contacto1CorreoController,
                decoration: const InputDecoration(labelText: 'CORREO:'),
              ),
              TextFormField(
                controller: _contacto1CelularController,
                decoration: const InputDecoration(labelText: 'CELULAR:'),
              ),
              const Text('CONTACTO 2'),
              TextFormField(
                controller: _contacto2NombreController,
                decoration: const InputDecoration(labelText: 'CONTACTO:'),
              ),
              TextFormField(
                controller: _contacto2CorreoController,
                decoration: const InputDecoration(labelText: 'CORREO:'),
              ),
              TextFormField(
                controller: _contacto2CelularController,
                decoration: const InputDecoration(labelText: 'CELULAR:'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final proveedor = Proveedor(
                          codigoProveedor: int.tryParse(_codigoProveedorController.text) ?? 0,
                          razonSocial: _razonSocialController.text,
                          noIdentificacion: _noIdentificacionController.text,
                          direccion: _direccionController.text,
                          metodoPago: _metodoPagoController.text,
                          categoria: _categoriaController.text,
                          telefono: _telefonoController.text,
                          credito: _creditoController.text,
                          correo: _correoController.text,
                          notas: _notasController.text,
                          contacto1Nombre: _contacto1NombreController.text,
                          contacto1Correo: _contacto1CorreoController.text,
                          contacto1Celular: _contacto1CelularController.text,
                          contacto2Nombre: _contacto2NombreController.text,
                          contacto2Correo: _contacto2CorreoController.text,
                          contacto2Celular: _contacto2CelularController.text,
                        );
                        Provider.of<ProveedorProviderAlmacen>(context, listen: false)
                            .agregarProveedor(proveedor);
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