import 'package:flutter/material.dart';
import 'package:myapp/Administracion/EntradaSalida/ClasesEntrada.dart';
import 'package:myapp/Administracion/EntradaSalida/InformeEntrada.dart';
import 'package:provider/provider.dart';
import 'entrada_provider.dart';

class RegistroEntrada extends StatefulWidget {
  const RegistroEntrada({super.key});

  @override
  _RegistroEntradaState createState() => _RegistroEntradaState();
}

class _RegistroEntradaState extends State<RegistroEntrada> {
  final _formKey = GlobalKey<FormState>();

  // Controladores para los campos de texto
  final _codigoEntradaController = TextEditingController();
  final _codigoProductoController = TextEditingController();
  final _descripcionController = TextEditingController();
  final _cantidadController = TextEditingController();
  final _precioController = TextEditingController();
  final _marcaController = TextEditingController();
  final _unidadController = TextEditingController();
  final _proveedorController = TextEditingController();

  DateTime? _fecha;

  @override
  void initState() {
    super.initState();
    _generarCodigoEntrada(); // Generar código inicial
  }

  Future<void> _generarCodigoEntrada() async {
    // Lógica para generar un código único para la entrada
    // Puedes obtener el último código de la base de datos y aumentarlo
    // Por ahora, usaremos un código de ejemplo
    _codigoEntradaController.text = 'ENT-001';
  }

  void _limpiarCasillas() {
    _codigoEntradaController.clear();
    _codigoProductoController.clear();
    _descripcionController.clear();
    _cantidadController.clear();
    _precioController.clear();
    _marcaController.clear();
    _unidadController.clear();
    _proveedorController.clear();
    _fecha = null;

    setState(() {}); // Actualiza el estado para limpiar la fecha
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Entrada de Productos'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _codigoEntradaController,
                decoration: const InputDecoration(labelText: 'Código Entrada'),
                enabled: false,
              ),
              Row(
                children: [
                  Text(
                    _fecha != null
                        ? 'Fecha: ${_fecha!.toString().split(' ')[0]}'
                        : 'Fecha: ',
                  ),
                  IconButton(
                    onPressed: () async {
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      if (picked != null && picked != _fecha) {
                        setState(() {
                          _fecha = picked;
                        });
                      }
                    },
                    icon: const Icon(Icons.calendar_today),
                  ),
                ],
              ),
              TextFormField(
                controller: _codigoProductoController,
                decoration: const InputDecoration(labelText: 'Código Producto'),
              ),
              TextFormField(
                controller: _descripcionController,
                decoration: const InputDecoration(labelText: 'Descripción'),
              ),
              TextFormField(
                controller: _cantidadController,
                decoration: const InputDecoration(labelText: 'Cantidad'),
              ),
              TextFormField(
                controller: _precioController,
                decoration: const InputDecoration(labelText: 'Precio'),
              ),
              TextFormField(
                controller: _marcaController,
                decoration: const InputDecoration(labelText: 'Marca'),
              ),
              TextFormField(
                controller: _unidadController,
                decoration: const InputDecoration(labelText: 'Unidad'),
              ),
              TextFormField(
                controller: _proveedorController,
                decoration: const InputDecoration(labelText: 'Proveedor'),
              ),
              ElevatedButton(
  onPressed: () {
    if (_formKey.currentState!.validate()) {
      final entradaProvider = Provider.of<EntradaProvider>(context, listen: false);

      final nuevaEntrada = Entrada(
        codigoEntrada: _codigoEntradaController.text,
        fecha: _fecha,
        codigoProducto: _codigoProductoController.text,
        descripcion: _descripcionController.text,
        cantidad: _cantidadController.text,
        precio: _precioController.text,
        marca: _marcaController.text,
        unidad: _unidadController.text,
        proveedor: _proveedorController.text,
      );

      entradaProvider.agregarEntrada(nuevaEntrada);

      // Mostrar un diálogo
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Entrada guardada'),
            content: const Text('¿Desea ver el informe de entradas y salidas?'),
            actions: <Widget>[
              TextButton(
                child: const Text('No'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Sí'),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InformeEntradas(),
                    ),
                  );
                },
              ),
            ],
          );
        },
      );
    }
  },
  child: const Text('Guardar'),
),
              ElevatedButton(
                onPressed: _limpiarCasillas,
                child: const Text('Limpiar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}