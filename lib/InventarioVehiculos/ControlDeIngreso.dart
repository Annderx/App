import 'package:flutter/material.dart';
import 'package:myapp/InventarioVehiculos/DocumentoSalida.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/services.dart';

class ControlIngresoScreen extends StatefulWidget {
  const ControlIngresoScreen({super.key});

  @override
  _ControlIngresoScreenState createState() => _ControlIngresoScreenState();
}

class _ControlIngresoScreenState extends State<ControlIngresoScreen> {
  // Variables de estado para los checkboxes
  bool tarjetaPropiedadIngresoSi = false;
  bool tarjetaPropiedadIngresoNo = false;
  bool soatFisicoIngresoSi = false;
  bool soatFisicoIngresoNo = false;
  bool soatDigitalIngresoSi = false;
  bool soatDigitalIngresoNo = false;
  bool rtvIngresoSi = false;
  bool rtvIngresoNo = false;
  bool certGasIngresoSi = false;
  bool certGasIngresoNo = false;

  String otrosDocumentosIngreso = '';
  String recepcionClienteNombre = '';
  String recepcionClienteDni = '';
  String recepcionClienteCargo = '';
  String recepcionTallerNombre = '';
  String recepcionTallerDni = '';
  String conformidad = '';
  String kilometraje = '';
  String combustibleE = '';
  String combustibleF = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conformidad de Ingreso'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSectionTitle('Documentos de Ingreso'),
            _buildDocumentoCard('Tarjeta de Propiedad', tarjetaPropiedadIngresoSi, tarjetaPropiedadIngresoNo, 
              (bool? value) => setState(() => tarjetaPropiedadIngresoSi = value!), 
              (bool? value) => setState(() => tarjetaPropiedadIngresoNo = value!)
            ),
            _buildDocumentoCard('Soat Fisico', soatFisicoIngresoSi, soatFisicoIngresoNo, 
              (bool? value) => setState(() => soatFisicoIngresoSi = value!), 
              (bool? value) => setState(() => soatFisicoIngresoNo = value!)
            ),
            _buildDocumentoCard('RTV', rtvIngresoSi, rtvIngresoNo, 
              (bool? value) => setState(() => rtvIngresoSi = value!), 
              (bool? value) => setState(() => rtvIngresoNo = value!)
            ),
            _buildTextField('Otros Documentos que Deja:', otrosDocumentosIngreso, (value) {
              setState(() {
                otrosDocumentosIngreso = value;
              });
            }),

            const SizedBox(height: 20),
            _buildSectionTitle('Recepción Cliente'),
            _buildTextField('Nombre', recepcionClienteNombre, (value) => setState(() => recepcionClienteNombre = value)),
            _buildTextField('DNI', recepcionClienteDni, (value) => setState(() => recepcionClienteDni = value)),
            _buildTextField('Cargo', recepcionClienteCargo, (value) => setState(() => recepcionClienteCargo = value)),

            const SizedBox(height: 20),
            _buildSectionTitle('Recepción Taller'),
            _buildTextField('Nombre', recepcionTallerNombre, (value) => setState(() => recepcionTallerNombre = value)),
            _buildTextField('DNI', recepcionTallerDni, (value) => setState(() => recepcionTallerDni = value)),
            _buildTextField('Conformidad', conformidad, (value) => setState(() => conformidad = value)),

            const SizedBox(height: 20),
            _buildSectionTitle('Kilometraje y Combustible'),
            Row(
              children: [
                Expanded(child: _buildTextField('Kilometraje', kilometraje, (value) => setState(() => kilometraje = value))),
                const SizedBox(width: 10),
                Expanded(child: _buildTextField('Combustible (E)', combustibleE, (value) => setState(() => combustibleE = value))),
                const SizedBox(width: 10),
                Expanded(child: _buildTextField('Combustible (F)', combustibleF, (value) => setState(() => combustibleF = value))),
              ],
            ),

            const SizedBox(height: 30),
            _buildButtons(),
          ],
        ),
      ),
    );
  }

  // Card para los documentos de ingreso
  Widget _buildDocumentoCard(String title, bool siValue, bool noValue, Function(bool?) onSiChanged, Function(bool?) onNoChanged) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Expanded(child: Text(title, style: const TextStyle(fontSize: 16))),
            Checkbox(value: siValue, onChanged: onSiChanged),
            const Text('Sí'),
            Checkbox(value: noValue, onChanged: onNoChanged),
            const Text('No'),
          ],
        ),
      ),
    );
  }

  // Función para mostrar un título de sección
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueAccent),
      ),
    );
  }

  // Función para construir un campo de texto
  Widget _buildTextField(String label, String value, Function(String) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        ),
      ),
    );
  }

  // Botones de acción
  Widget _buildButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton.icon(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          label: const Text('Atrás'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.redAccent,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
        ),
        ElevatedButton.icon(
          onPressed: () {
            // Lógica para guardar o continuar
          },
          icon: const Icon(Icons.save),
          label: const Text('Guardar'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
        ),
      ],
    );
  }
}
