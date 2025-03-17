import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ClasesOficina.dart';
import 'clases_provider.dart';

class RegistroAreaTrabajo extends StatefulWidget {
  const RegistroAreaTrabajo({super.key});

  @override
  State<RegistroAreaTrabajo> createState() => _RegistroAreaTrabajoState();
}

class _RegistroAreaTrabajoState extends State<RegistroAreaTrabajo> {
  final _formKey = GlobalKey<FormState>();

  final _codigoAreaController = TextEditingController();
  final _nombreController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _cargarDatos();
  }

  Future<void> _cargarDatos() async {
    setState(() {});
  }

  void _limpiarCasillas() {
    _codigoAreaController.clear();
    _nombreController.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Área de Trabajo'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _codigoAreaController,
                decoration: const InputDecoration(labelText: 'CODIGO AREA:'),
                enabled: false,
              ),
              TextFormField(
                controller: _nombreController,
                decoration: const InputDecoration(labelText: 'NOMBRE:'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final areaTrabajo = AreaTrabajo(
                          codigoArea: int.tryParse(_codigoAreaController.text) ?? 0,
                          nombre: _nombreController.text,
                        );
                        Provider.of<AreaTrabajoProvider>(context, listen: false)
                            .agregarAreaTrabajo(areaTrabajo);
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