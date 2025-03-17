import 'package:flutter/material.dart';
import 'package:myapp/Administracion/EntradaSalida/ClasesSalida.dart';
import 'package:myapp/Administracion/EntradaSalida/InformeSalida.dart';
import 'package:myapp/Administracion/EntradaSalida/salida_provider.dart';
import 'package:provider/provider.dart';

/*class SalidaProductos extends StatelessWidget {
  const SalidaProductos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Salida De Productos'),
      ),      
    );
  }
}*/

class RegistroSalida extends StatefulWidget {
  const RegistroSalida({super.key});

  @override
  State<RegistroSalida> createState() => _RegistroSalidaState();
}

class _RegistroSalidaState extends State<RegistroSalida> {
  final _formKey = GlobalKey<FormState>();

  // Controladores para los campos de texto
  final _codigoSalidaController = TextEditingController();
  final _codigoProductoController = TextEditingController();
  final _descripcionController = TextEditingController();
  final _cantidadController = TextEditingController();
  final _precioController = TextEditingController();
  final _marcaController = TextEditingController();
  final _unidadController = TextEditingController();
  final _empleadoController = TextEditingController();
  final _clienteController = TextEditingController();
  final _ubicacionController = TextEditingController();

  DateTime? _fecha;
  String? _estado;

  @override
  void initState() {
    super.initState();
    _cargarDatos(); // Llama a la función para cargar los datos iniciales
  }

  Future<void> _cargarDatos() async {
    // Aquí puedes cargar los datos desde una base de datos o API
    // Por ejemplo:
    // _proveedores = await obtenerProveedores();

    // Luego, actualiza el estado para que los DropdownButton se actualicen
    setState(() {});
  }

  // ignore: unused_element
  void _limpiarCasillas() {
    _codigoSalidaController.clear();
    _codigoProductoController.clear();
    _descripcionController.clear();
    _cantidadController.clear();
    _precioController.clear();
    _marcaController.clear();
    _unidadController.clear();
    _empleadoController.clear();
    _clienteController.clear();
    _ubicacionController.clear();
    _fecha = null;
    _estado = null;

    setState(() {}); // Actualiza el estado para limpiar la fecha
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro de Salida de Productos')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Código de salida y fecha en la misma línea
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _codigoSalidaController,
                      decoration: const InputDecoration(
                        labelText: 'Código Salida',
                      ),
                      enabled: false,
                    ),
                  ),
                  Expanded(
                    child: Row(
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
                  ),
                ],
              ),
              // Estado
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Estado'),
                value: _estado,
                items:
                    ['Disponible', 'No Disponible']
                        .map(
                          (estado) => DropdownMenuItem<String>(
                            value: estado,
                            child: Text(estado),
                          ),
                        )
                        .toList(),
                onChanged: (value) {
                  setState(() {
                    _estado = value;
                  });
                },
              ),
              // Datos del producto y empleado en columnas
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _codigoProductoController,
                          decoration: const InputDecoration(
                            labelText: 'Código Producto',
                          ),
                        ),
                        TextFormField(
                          controller: _descripcionController,
                          decoration: const InputDecoration(
                            labelText: 'Descripción',
                          ),
                        ),
                        TextFormField(
                          controller: _cantidadController,
                          decoration: const InputDecoration(
                            labelText: 'Cantidad',
                          ),
                        ),
                        TextFormField(
                          controller: _ubicacionController,
                          decoration: const InputDecoration(
                            labelText: 'Ubicación',
                          ),
                        ),
                        TextFormField(
                          controller: _precioController,
                          decoration: const InputDecoration(
                            labelText: 'Precio',
                          ),
                        ),
                        TextFormField(
                          controller: _marcaController,
                          decoration: const InputDecoration(labelText: 'Marca'),
                        ),
                        TextFormField(
                          controller: _unidadController,
                          decoration: const InputDecoration(
                            labelText: 'Unidad',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _empleadoController,
                          decoration: const InputDecoration(
                            labelText: 'Empleado',
                          ),
                        ),
                        TextFormField(
                          controller: _clienteController,
                          decoration: const InputDecoration(
                            labelText: 'Cliente',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // Botones en la misma línea
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final salidaProvider = Provider.of<SalidaProvider>(
                          context,
                          listen: false,
                        );

                        final nuevaSalida = Salida(
                          codigoSalida: _codigoSalidaController.text,
                          fecha: _fecha,
                          codigoProducto: _codigoProductoController.text,
                          descripcion: _descripcionController.text,
                          cantidad: _cantidadController.text,
                          precio: _precioController.text,
                          marca: _marcaController.text,
                          unidad: _unidadController.text,
                          empleado: _empleadoController.text,
                          cliente: _clienteController.text,
                          ubicacion: _ubicacionController.text,
                          estado: _estado!,
                        );

                        salidaProvider.agregarSalida(nuevaSalida);

                        // Mostrar un diálogo
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Salida guardada'),
                              content: const Text(
                                '¿Desea ver el informe de entradas y salidas?',
                              ),
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
                                        builder: (context) => InformeSalidas(),
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
