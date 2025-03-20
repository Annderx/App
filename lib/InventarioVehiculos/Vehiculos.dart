import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:myapp/InventarioVehiculos/AccesoriosVehiculares.dart';

void main() {
  runApp(InventarioVehicular());
}

class InventarioVehicular extends StatelessWidget {
  const InventarioVehicular({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inventario Vehicular',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[100], // Fondo suave
      ),
      home: InventarioVehicularScreen(),
    );
  }
}

class InventarioVehicularScreen extends StatefulWidget {
  const InventarioVehicularScreen({super.key});

  @override
  _InventarioVehicularScreenState createState() =>
      _InventarioVehicularScreenState();
}

class _InventarioVehicularScreenState extends State<InventarioVehicularScreen> {
  String _fechaHora = '';
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _actualizarFechaHora();
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      _actualizarFechaHora();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _actualizarFechaHora() {
    if (mounted) {
      setState(() {
        _fechaHora = DateFormat('dd/MM/yyyy HH:mm:ss').format(DateTime.now());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventario Vehicular'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.settings), onPressed: () {}),
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildInfoCard(),
              _buildClienteSection(),
              _buildVehiculoSection(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AccesoriosVehicularesScreen(),
            ),
          );
        },
        label: Text("Siguiente"),
        icon: Icon(Icons.arrow_forward),
      ),
    );
  }

  Widget _buildInfoCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'INVENTARIO DE VEHÍCULO',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildRowInfo("No Inventario:", "000123"),
            _buildRowInfo("Fecha y Hora:", _fechaHora),
            _buildRowInfo("RUC:", "20474979068"),
            _buildRowInfo("Taller:", "Servicios Diesel Gastulo S.R.L"),
            _buildDropdownField("Responsable de Taller", ["Seleccione", "Juan Perez", "Maria Garcia"]),
          ],
        ),
      ),
    );
  }

  Widget _buildClienteSection() {
    return ExpansionTile(
      title: Text("Datos Cliente"),
      leading: Icon(Icons.person),
      children: [
        _buildTextField("Tipo de Cliente"),
        _buildTextField("RUC"),
        _buildTextField("Razón Social"),
        _buildTextField("Celular"),
        _buildTextField("Email"),
      ],
    );
  }

  Widget _buildVehiculoSection() {
    return ExpansionTile(
      title: Text("Datos Vehículo"),
      leading: Icon(Icons.directions_car),
      children: [
        _buildTextField("Tipo"),
        _buildTextField("VIN"),
        _buildTextField("Marca"),
        _buildTextField("Modelo"),
        _buildTextField("Placa"),
        _buildTextField("Combustible"),
        _buildTextField("Año de Fabricación"),
        _buildTextField("Año de Modelo"),
      ],
    );
  }

  Widget _buildRowInfo(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Expanded(child: Text(label, style: TextStyle(fontWeight: FontWeight.bold))),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  Widget _buildTextField(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  Widget _buildDropdownField(String label, List<String> options) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        items: options.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (_) {},
        value: options.first,
      ),
    );
  }
}
