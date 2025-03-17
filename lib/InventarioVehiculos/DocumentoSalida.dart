import 'package:flutter/material.dart';

class DocumentosSalida extends StatelessWidget {
  final bool tarjetaPropiedadSalidaSi;
  final bool tarjetaPropiedadSalidaNo;
  final bool soatFisicoSalidaSi;
  final bool soatFisicoSalidaNo;
  final bool soatDigitalSalidaSi;
  final bool soatDigitalSalidaNo;
  final bool rtvSalidaSi;
  final bool rtvSalidaNo;
  final bool certGasSalidaSi;
  final bool certGasSalidaNo;
  final String otrosDocumentosSalida;
  final Function(bool?) onTarjetaPropiedadSiChanged;
  final Function(bool?) onTarjetaPropiedadNoChanged;
  final Function(bool?) onSoatFisicoSiChanged;
  final Function(bool?) onSoatFisicoNoChanged;
  final Function(bool?) onSoatDigitalSiChanged;
  final Function(bool?) onSoatDigitalNoChanged;
  final Function(bool?) onRtvSiChanged;
  final Function(bool?) onRtvNoChanged;
  final Function(bool?) onCertGasSiChanged;
  final Function(bool?) onCertGasNoChanged;
  final Function(String) onOtrosDocumentosChanged;

  const DocumentosSalida({super.key, 
    required this.tarjetaPropiedadSalidaSi,
    required this.tarjetaPropiedadSalidaNo,
    required this.soatFisicoSalidaSi,
    required this.soatFisicoSalidaNo,
    required this.soatDigitalSalidaSi,
    required this.soatDigitalSalidaNo,
    required this.rtvSalidaSi,
    required this.rtvSalidaNo,
    required this.certGasSalidaSi,
    required this.certGasSalidaNo,
    required this.otrosDocumentosSalida,
    required this.onTarjetaPropiedadSiChanged,
    required this.onTarjetaPropiedadNoChanged,
    required this.onSoatFisicoSiChanged,
    required this.onSoatFisicoNoChanged,
    required this.onSoatDigitalSiChanged,
    required this.onSoatDigitalNoChanged,
    required this.onRtvSiChanged,
    required this.onRtvNoChanged,
    required this.onCertGasSiChanged,
    required this.onCertGasNoChanged,
    required this.onOtrosDocumentosChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 20),
        Text('DOCUMENTOS DE SALIDA:'),
        _buildDocumentoRow(context, 'Tarjeta de Propiedad', tarjetaPropiedadSalidaSi, tarjetaPropiedadSalidaNo, onTarjetaPropiedadSiChanged, onTarjetaPropiedadNoChanged, salida: true),
        _buildDocumentoRow(context, 'Soat Fisico', soatFisicoSalidaSi, soatFisicoSalidaNo, onSoatFisicoSiChanged, onSoatFisicoNoChanged, salida: true),
        _buildDocumentoRow(context, 'Soat digital', soatDigitalSalidaSi, soatDigitalSalidaNo, onSoatDigitalSiChanged, onSoatDigitalNoChanged, salida: true),
        _buildDocumentoRow(context, 'RTV', rtvSalidaSi, rtvSalidaNo, onRtvSiChanged, onRtvNoChanged, salida: true),
        _buildDocumentoRow(context, 'Cert. Gas', certGasSalidaSi, certGasSalidaNo, onCertGasSiChanged, onCertGasNoChanged, salida: true),
        SizedBox(height: 20),
        Text('OTROS DOCUMENTOS QUE DEJA:'),
        TextField(
          maxLines: 2,
          decoration: InputDecoration(border: OutlineInputBorder()),
          onChanged: onOtrosDocumentosChanged,
        ),
      ],
    );
  }

  // Función para construir una fila de documento
  Widget _buildDocumentoRow(BuildContext context, String nombreDocumento, bool siValue, bool noValue, Function(bool?) onSiChanged, Function(bool?) onNoChanged, {bool fechaVencimiento = false, bool salida = false}) {
    return Row(
      children: <Widget>[
        Text(nombreDocumento),
        Checkbox(
          value: siValue,
          onChanged: onSiChanged,
        ),
        Text('SI'),
        Checkbox(
          value: noValue,
          onChanged: onNoChanged,
        ),
        Text('NO'),
        if (fechaVencimiento) ...[
          SizedBox(width: 20),
          Text('VENCE:'),
          SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {
              // Lógica para seleccionar la fecha de vencimiento
              _seleccionarFechaVencimiento(context);
            },
            child: Text('Seleccionar Fecha'),
          ),
        ],
        if (salida) ...[
          SizedBox(width: 20),
          Text('OBSERVACIONES:'),
          SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
          ),
        ],
      ],
    );
  }

  // Función para seleccionar la fecha de vencimiento
  Future<void> _seleccionarFechaVencimiento(BuildContext context) async {
    final DateTime? fechaSeleccionada = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (fechaSeleccionada != null) {
      // Lógica para guardar la fecha seleccionada
      print('Fecha seleccionada: $fechaSeleccionada');
    }
  }
}