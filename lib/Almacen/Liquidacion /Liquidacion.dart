import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ClasesLiquidacion.dart';
import 'liquidacion_provider.dart';

class RegistroLiquidacionProductos extends StatefulWidget {
  const RegistroLiquidacionProductos({super.key});

  @override
  State<RegistroLiquidacionProductos> createState() =>
      _RegistroLiquidacionProductosState();
}

class _RegistroLiquidacionProductosState
    extends State<RegistroLiquidacionProductos> {
  final _formKey = GlobalKey<FormState>();

  // Controladores para los campos de texto
  final _codigoLiquidacionController = TextEditingController();
  final _tipoDocumentoController = TextEditingController();
  final _motivoController = TextEditingController();
  final _proformaController = TextEditingController();
  final _arfController = TextEditingController();
  final _descripcionProductoController = TextEditingController();
  final _medidaProductoController = TextEditingController();
  final _totalSolesController = TextEditingController();
  final _recepcionMaterialController = TextEditingController();
  final _condicionController = TextEditingController();
  final _sistemaController = TextEditingController();
  final _solicitudPedidoController = TextEditingController();
  final _familiaController = TextEditingController();
  final _ubicacionProductoController = TextEditingController();
  final _marcaProductoController = TextEditingController();
  final _cotDolarController = TextEditingController();
  final _totalDolaresController = TextEditingController();
  final _empleadoController = TextEditingController();
  final _placaVehiculoController = TextEditingController();
  final _vehiculoController = TextEditingController();
  final _marcaVehiculoController = TextEditingController();
  final _modeloVehiculoController = TextEditingController();
  final _clienteController = TextEditingController();
  final _precioProductoController = TextEditingController();
  final _cantidadProductoController = TextEditingController();
  final _proveedorController = TextEditingController();
  final _fechaRegistroController = TextEditingController();
  final _areaController = TextEditingController();
  final _fechaSalidaController = TextEditingController();
  final _categoriaController = TextEditingController();

  DateTime? _fechaEntrega;

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
    _codigoLiquidacionController.clear();
    _tipoDocumentoController.clear();
    _motivoController.clear();
    _proformaController.clear();
    _arfController.clear();
    _descripcionProductoController.clear();
    _medidaProductoController.clear();
    _totalSolesController.clear();
    _recepcionMaterialController.clear();
    _condicionController.clear();
    _sistemaController.clear();
    _solicitudPedidoController.clear();
    _familiaController.clear();
    _ubicacionProductoController.clear();
    _marcaProductoController.clear();
    _cotDolarController.clear();
    _totalDolaresController.clear();
    _empleadoController.clear();
    _placaVehiculoController.clear();
    _vehiculoController.clear();
    _marcaVehiculoController.clear();
    _modeloVehiculoController.clear();
    _clienteController.clear();
    _precioProductoController.clear();
    _cantidadProductoController.clear();
    _proveedorController.clear();
    _fechaRegistroController.clear();
    _areaController.clear();
    _fechaSalidaController.clear();
    _categoriaController.clear();
    _fechaEntrega = null;

    setState(() {}); // Actualiza el estado para limpiar la fecha
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Liquidación de Productos'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Código de liquidación y fecha de entrega en la misma línea
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _codigoLiquidacionController,
                      decoration:
                          const InputDecoration(labelText: 'CODIGO LIQUIDACION:'),
                      enabled: false,
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          _fechaEntrega != null
                              ? 'Fecha de Entrega: ${_fechaEntrega!.toString().split(' ')[0]}'
                              : 'Fecha de Entrega: ',
                        ),
                        IconButton(
                          onPressed: () async {
                            final DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                            );
                            if (picked != null && picked != _fechaEntrega) {
                              setState(() {
                                _fechaEntrega = picked;
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
              // Tipo de documento y condición en la misma línea
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _tipoDocumentoController,
                      decoration:
                          const InputDecoration(labelText: 'TIPO DE DOCUMENTO:'),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _condicionController,
                      decoration: const InputDecoration(labelText: 'CONDICION:'),
                    ),
                  ),
                ],
              ),
              // Motivo y sistema en la misma línea
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _motivoController,
                      decoration: const InputDecoration(labelText: 'MOTIVO:'),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _sistemaController,
                      decoration: const InputDecoration(labelText: 'SISTEMA:'),
                    ),
                  ),
                ],
              ),
              // Proforma y solicitud de pedido en la misma línea
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _proformaController,
                      decoration: const InputDecoration(labelText: 'PROFORMA:'),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _solicitudPedidoController,
                      decoration:
                          const InputDecoration(labelText: 'SOLICITUD DE PEDIDO:'),
                    ),
                  ),
                ],
              ),
              // ARF y familia en la misma línea
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _arfController,
                      decoration: const InputDecoration(labelText: 'ARF:'),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _familiaController,
                      decoration: const InputDecoration(labelText: 'FAMILIA:'),
                    ),
                  ),
                ],
              ),
              // Datos del producto
              TextFormField(
                controller: _descripcionProductoController,
                decoration: const InputDecoration(labelText: 'DESCRIPCION:'),
              ),
              TextFormField(
                controller: _medidaProductoController,
                decoration: const InputDecoration(labelText: 'MEDIDA:'),
              ),
              // Ubicación y marca del producto en la misma línea
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _ubicacionProductoController,
                      decoration: const InputDecoration(labelText: 'UBICACION:'),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _marcaProductoController,
                      decoration: const InputDecoration(labelText: 'MARCA:'),
                    ),
                  ),
                ],
              ),
              // Precio y cantidad del producto en la misma línea
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _precioProductoController,
                      decoration: const InputDecoration(labelText: 'PRECIO:'),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _cantidadProductoController,
                      decoration: const InputDecoration(labelText: 'CANTIDAD:'),
                    ),
                  ),
                ],
              ),
              // Total soles y cot. dólar en la misma línea
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _totalSolesController,
                      decoration: const InputDecoration(labelText: 'TOTAL SOLES:'),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _cotDolarController,
                      decoration: const InputDecoration(labelText: 'COT. DOLAR:'),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _totalDolaresController,
                      decoration: const InputDecoration(labelText: 'TOTAL DOLARES:'),
                    ),
                  ),
                ],
              ),
              TextFormField(
                controller: _recepcionMaterialController,
                decoration:
                    const InputDecoration(labelText: 'RECEPCION DE MATERIAL:'),
              ),
              // Datos del empleado y vehículo en la misma línea
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _empleadoController,
                      decoration: const InputDecoration(labelText: 'EMPLEADO:'),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _placaVehiculoController,
                            decoration: const InputDecoration(labelText: 'PLACA:'),
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: _vehiculoController,
                            decoration: const InputDecoration(labelText: 'VEHICULO:'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // Marca y modelo del vehículo en la misma línea
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _marcaVehiculoController,
                      decoration: const InputDecoration(labelText: 'MARCA:'),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _modeloVehiculoController,
                      decoration: const InputDecoration(labelText: 'MODELO:'),
                    ),
                  ),
                ],
              ),
              // Cliente y datos del proveedor en la misma línea
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _clienteController,
                      decoration: const InputDecoration(labelText: 'CLIENTE:'),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _proveedorController,
                      decoration: const InputDecoration(labelText: 'PROVEEDOR:'),
                    ),
                  ),
                ],
              ),
              // Fecha de registro y área en la misma línea
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _fechaRegistroController,
                      decoration:
                          const InputDecoration(labelText: 'FECHA DE REGISTRO:'),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _areaController,
                      decoration: const InputDecoration(labelText: 'AREA:'),
                    ),
                  ),
                ],
              ),
              // Fecha de salida y categoría en la misma línea
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _fechaSalidaController,
                      decoration:
                          const InputDecoration(labelText: 'FECHA DE SALIDA:'),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _categoriaController,
                      decoration: const InputDecoration(labelText: 'CATEGORIA:'),
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
                        // Guardar los datos
                        final liquidacion = LiquidacionProducto(
                          codigoLiquidacion: int.tryParse(_codigoLiquidacionController.text) ?? 0,
                          fechaEntrega: _fechaEntrega ?? DateTime.now(),
                          tipoDocumento: _tipoDocumentoController.text,
                          condicion: _condicionController.text,
                          motivo: _motivoController.text,
                          sistema: _sistemaController.text,
                          proforma: _proformaController.text,
                          solicitudPedido: _solicitudPedidoController.text,
                          arf: _arfController.text,
                          familia: _familiaController.text,
                          descripcionProducto: _descripcionProductoController.text,
                          medidaProducto: _medidaProductoController.text,
                          ubicacionProducto: _ubicacionProductoController.text,
                          marcaProducto: _marcaProductoController.text,
                          precioProducto: double.tryParse(_precioProductoController.text) ?? 0.0,
                          cantidadProducto: int.tryParse(_cantidadProductoController.text) ?? 0,
                          totalSoles: double.tryParse(_totalSolesController.text) ?? 0.0,
                          cotDolar: double.tryParse(_cotDolarController.text) ?? 0.0,
                          totalDolares: double.tryParse(_totalDolaresController.text) ?? 0.0,
                          recepcionMaterial: _recepcionMaterialController.text,
                          empleado: _empleadoController.text,
                          placaVehiculo: _placaVehiculoController.text,
                          vehiculo: _vehiculoController.text,
                          marcaVehiculo: _marcaVehiculoController.text,
                          modeloVehiculo: _modeloVehiculoController.text,
                          cliente: _clienteController.text,
                          proveedor: _proveedorController.text,
                          fechaRegistro: DateTime.tryParse(_fechaRegistroController.text) ?? DateTime.now(),
                          area: _areaController.text,
                          fechaSalida: DateTime.tryParse(_fechaSalidaController.text) ?? DateTime.now(),
                          categoria: _categoriaController.text,
                        );
                        Provider.of<LiquidacionProviderAlmacen>(context, listen: false)
                            .agregarLiquidacion(liquidacion);
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