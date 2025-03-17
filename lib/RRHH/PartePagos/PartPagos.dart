import 'package:flutter/material.dart';

class RegistroPartePagoTrabajadores extends StatefulWidget { // Clase principal del widget
  const RegistroPartePagoTrabajadores({super.key});

  @override
  _RegistroPartePagoTrabajadoresState createState() =>
      _RegistroPartePagoTrabajadoresState();
}

class _RegistroPartePagoTrabajadoresState
    extends State<RegistroPartePagoTrabajadores> {
  final _formKey = GlobalKey<FormState>();

  // Controladores para los campos de texto
  final _colaboradorController = TextEditingController();
  final _montoAcuenta1Controller = TextEditingController();
  final _fechaPagoAcuenta1Controller = TextEditingController();
  final _formaPagoAcuenta1Controller = TextEditingController();
  final _observacionAcuenta1Controller = TextEditingController();
  final _montoAcuenta2Controller = TextEditingController();
  final _fechaPagoAcuenta2Controller = TextEditingController();
  final _formaPagoAcuenta2Controller = TextEditingController();
  final _observacionAcuenta2Controller = TextEditingController();
  final _montoAcuenta3Controller = TextEditingController();
  final _fechaPagoAcuenta3Controller = TextEditingController();
  final _formaPagoAcuenta3Controller = TextEditingController();
  final _observacionAcuenta3Controller = TextEditingController();
  final _montoAcuenta4Controller = TextEditingController();
  final _fechaPagoAcuenta4Controller = TextEditingController();
  final _formaPagoAcuenta4Controller = TextEditingController();
  final _observacionAcuenta4Controller = TextEditingController();
  final _montoAcuenta5Controller = TextEditingController();
  final _fechaPagoAcuenta5Controller = TextEditingController();
  final _formaPagoAcuenta5Controller = TextEditingController();
  final _observacionAcuenta5Controller = TextEditingController();
  final _montoAcuenta6Controller = TextEditingController();
  final _fechaPagoAcuenta6Controller = TextEditingController();
  final _formaPagoAcuenta6Controller = TextEditingController();
  final _observacionAcuenta6Controller = TextEditingController();
  final _montoAcuenta7Controller = TextEditingController();
  final _fechaPagoAcuenta7Controller = TextEditingController();
  final _formaPagoAcuenta7Controller = TextEditingController();
  final _observacionAcuenta7Controller = TextEditingController();
  final _montoAcuenta8Controller = TextEditingController();
  final _fechaPagoAcuenta8Controller = TextEditingController();
  final _formaPagoAcuenta8Controller = TextEditingController();
  final _observacionAcuenta8Controller = TextEditingController();
  final _montoAcuenta9Controller = TextEditingController();
  final _fechaPagoAcuenta9Controller = TextEditingController();
  final _formaPagoAcuenta9Controller = TextEditingController();
  final _observacionAcuenta9Controller = TextEditingController();
  final _montoAcuenta10Controller = TextEditingController();
  final _fechaPagoAcuenta10Controller = TextEditingController();
  final _formaPagoAcuenta10Controller = TextEditingController();
  final _observacionAcuenta10Controller = TextEditingController();
  final _saldoPagarController = TextEditingController();

  DateTime? _fecha;

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

  void _limpiarCasillas() {
    _colaboradorController.clear();
    _montoAcuenta1Controller.clear();
    _fechaPagoAcuenta1Controller.clear();
    _formaPagoAcuenta1Controller.clear();
    _observacionAcuenta1Controller.clear();
    _montoAcuenta2Controller.clear();
    _fechaPagoAcuenta2Controller.clear();
    _formaPagoAcuenta2Controller.clear();
    _observacionAcuenta2Controller.clear();
    _montoAcuenta3Controller.clear();
    _fechaPagoAcuenta3Controller.clear();
    _formaPagoAcuenta3Controller.clear();
    _observacionAcuenta3Controller.clear();
    _montoAcuenta4Controller.clear();
    _fechaPagoAcuenta4Controller.clear();
    _formaPagoAcuenta4Controller.clear();
    _observacionAcuenta4Controller.clear();
    _montoAcuenta5Controller.clear();
    _fechaPagoAcuenta5Controller.clear();
    _formaPagoAcuenta5Controller.clear();
    _observacionAcuenta5Controller.clear();
    _montoAcuenta6Controller.clear();
    _fechaPagoAcuenta6Controller.clear();
    _formaPagoAcuenta6Controller.clear();
    _observacionAcuenta6Controller.clear();
    _montoAcuenta7Controller.clear();
    _fechaPagoAcuenta7Controller.clear();
    _formaPagoAcuenta7Controller.clear();
    _observacionAcuenta7Controller.clear();
    _montoAcuenta8Controller.clear();
    _fechaPagoAcuenta8Controller.clear();
    _formaPagoAcuenta8Controller.clear();
    _observacionAcuenta8Controller.clear();
    _montoAcuenta9Controller.clear();
    _fechaPagoAcuenta9Controller.clear();
    _formaPagoAcuenta9Controller.clear();
    _observacionAcuenta9Controller.clear();
    _montoAcuenta10Controller.clear();
    _fechaPagoAcuenta10Controller.clear();
    _formaPagoAcuenta10Controller.clear();
    _observacionAcuenta10Controller.clear();
    _saldoPagarController.clear();
    _fecha = null;

    setState(() {}); // Actualiza el estado para limpiar la fecha
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Parte de Pago de Trabajadores'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ... (resto del código)
            ],
          ),
        ),
      ),
    );
  }
}