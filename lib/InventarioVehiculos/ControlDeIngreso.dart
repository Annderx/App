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
  // Variables de estado para los checkboxes de ingreso
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

  // Variables de estado para los campos de texto de ingreso
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

  // Variables de estado para los checkboxes de salida
  bool tarjetaPropiedadSalidaSi = false;
  bool tarjetaPropiedadSalidaNo = false;
  bool soatFisicoSalidaSi = false;
  bool soatFisicoSalidaNo = false;
  bool soatDigitalSalidaSi = false;
  bool soatDigitalSalidaNo = false;
  bool rtvSalidaSi = false;
  bool rtvSalidaNo = false;
  bool certGasSalidaSi = false;
  bool certGasSalidaNo = false;

  // Variables de estado para los campos de texto de salida
  String otrosDocumentosSalida = '';
  String entregaTallerNombre = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CONFORMIDAD DE INGRESO'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('CONFORMIDAD DE INGRESO:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              Text('DOCUMENTOS DE INGRESO:'),
              _buildDocumentoRow(context, 'Tarjeta de Propiedad', tarjetaPropiedadIngresoSi, tarjetaPropiedadIngresoNo, (bool? si) {
                setState(() {
                  tarjetaPropiedadIngresoSi = si ?? false;
                  tarjetaPropiedadIngresoNo = !tarjetaPropiedadIngresoSi;
                });
              }, (bool? no) {
                setState(() {
                  tarjetaPropiedadIngresoNo = no ?? false;
                  tarjetaPropiedadIngresoSi = !tarjetaPropiedadIngresoNo;
                });
              }),
              _buildDocumentoRow(context, 'Soat Fisico', soatFisicoIngresoSi, soatFisicoIngresoNo, (bool? si) {
                setState(() {
                  soatFisicoIngresoSi = si ?? false;
                  soatFisicoIngresoNo = !soatFisicoIngresoSi;
                });
              }, (bool? no) {
                setState(() {
                  soatFisicoIngresoNo = no ?? false;
                  soatFisicoIngresoSi = !soatFisicoIngresoNo;
                });
              }, fechaVencimiento: true),
              _buildDocumentoRow(context, 'Soat digital', soatDigitalIngresoSi, soatDigitalIngresoNo, (bool? si) {
                setState(() {
                  soatDigitalIngresoSi = si ?? false;
                  soatDigitalIngresoNo = !soatDigitalIngresoSi;
                });
              }, (bool? no) {
                setState(() {
                  soatDigitalIngresoNo = no ?? false;
                  soatDigitalIngresoSi = !soatDigitalIngresoNo;
                });
              }, fechaVencimiento: true),
              _buildDocumentoRow(context, 'RTV', rtvIngresoSi, rtvIngresoNo, (bool? si) {
                setState(() {
                  rtvIngresoSi = si ?? false;
                  rtvIngresoNo = !rtvIngresoSi;
                });
              }, (bool? no) {
                setState(() {
                  rtvIngresoNo = no ?? false;
                  rtvIngresoSi = !rtvIngresoNo;
                });
              }, fechaVencimiento: true),
              _buildDocumentoRow(context, 'Cert. Gas', certGasIngresoSi, certGasIngresoNo, (bool? si) {
                setState(() {
                  certGasIngresoSi = si ?? false;
                  certGasIngresoNo = !certGasIngresoSi;
                });
              }, (bool? no) {
                setState(() {
                  certGasIngresoNo = no ?? false;
                  certGasIngresoSi = !certGasIngresoNo;
                });
              }, fechaVencimiento: true),
              SizedBox(height: 20),
              Text('OTROS DOCUMENTOS QUE DEJA:'),
              TextField(
                maxLines: 2,
                decoration: InputDecoration(border: OutlineInputBorder()),
                onChanged: (value) {
                  setState(() {
                    otrosDocumentosIngreso = value;
                  });
                },
              ),
              SizedBox(height: 20),
              Text('RECEPCION CLIENTE:'),
              Image.asset('assets/honda_hrv.png', width: 200), // Reemplaza con la ruta de tu imagen
              TextField(
                decoration: InputDecoration(labelText: 'NOMBRE'),
                onChanged: (value) {
                  setState(() {
                    recepcionClienteNombre = value;
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'DNI'),
                onChanged: (value) {
                  setState(() {
                    recepcionClienteDni = value;
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'CARGO'),
                onChanged: (value) {
                  setState(() {
                    recepcionClienteCargo = value;
                  });
                },
              ),
              SizedBox(height: 20),
              Text('RECEPCION DE TALLER:'),
              TextField(
                decoration: InputDecoration(labelText: 'NOMBRE'),
                onChanged: (value) {
                  setState(() {
                    recepcionTallerNombre = value;
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'DNI'),
                onChanged: (value) {
                  setState(() {
                    recepcionTallerDni = value;
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'CONFORMIDAD'),
                onChanged: (value) {
                  setState(() {
                    conformidad = value;
                  });
                },
              ),
              Row(
                children: <Widget>[
                  Text('KILOMETRAJE:'),
                  SizedBox(width: 20),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      ),
                      onChanged: (value) {
                        setState(() {
                          kilometraje = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  Text('E'),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      ),
                      onChanged: (value) {
                        setState(() {
                          combustibleE = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  Text('F'),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      ),
                      onChanged: (value) {
                        setState(() {
                          combustibleF = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              DocumentosSalida(
                tarjetaPropiedadSalidaSi: tarjetaPropiedadSalidaSi,
                tarjetaPropiedadSalidaNo: tarjetaPropiedadSalidaNo,
                soatFisicoSalidaSi: soatFisicoSalidaSi,
                soatFisicoSalidaNo: soatFisicoSalidaNo,
                soatDigitalSalidaSi: soatDigitalSalidaSi,
                soatDigitalSalidaNo: soatDigitalSalidaNo,
                rtvSalidaSi: rtvSalidaSi,
                rtvSalidaNo: rtvSalidaNo,
                certGasSalidaSi: certGasSalidaSi,
                certGasSalidaNo: certGasSalidaNo,
                otrosDocumentosSalida: otrosDocumentosSalida,
                onTarjetaPropiedadSiChanged: (bool? si) {
                  setState(() {
                    tarjetaPropiedadSalidaSi = si ?? false;
                    tarjetaPropiedadSalidaNo = !tarjetaPropiedadSalidaSi;
                  });
                },
                onTarjetaPropiedadNoChanged: (bool? no) {
                  setState(() {
                    tarjetaPropiedadSalidaNo = no ?? false;
                    tarjetaPropiedadSalidaSi = !tarjetaPropiedadSalidaNo;
                  });
                },
                onSoatFisicoSiChanged: (bool? si) {
                  setState(() {
                    soatFisicoSalidaSi = si ?? false;
                    soatFisicoSalidaNo = !soatFisicoSalidaSi;
                  });
                },
                onSoatFisicoNoChanged: (bool? no) {
                  setState(() {
                    soatFisicoSalidaNo = no ?? false;
                    soatFisicoSalidaSi = !soatFisicoSalidaNo;
                  });
                },
                onSoatDigitalSiChanged: (bool? si) {
                  setState(() {
                    soatDigitalSalidaSi = si ?? false;
                    soatDigitalSalidaNo = !soatDigitalSalidaSi;
                  });
                },
                onSoatDigitalNoChanged: (bool? no) {
                  setState(() {
                    soatDigitalSalidaNo = no ?? false;
                    soatDigitalSalidaSi = !soatDigitalSalidaNo;
                  });
                },
                onRtvSiChanged: (bool? si) {
                  setState(() {
                    rtvSalidaSi = si ?? false;
                    rtvSalidaNo = !rtvSalidaSi;
                  });
                },
                onRtvNoChanged: (bool? no) {
                  setState(() {
                    rtvSalidaNo = no ?? false;
                    rtvSalidaSi = !rtvSalidaNo;
                  });
                },
                onCertGasSiChanged: (bool? si) {
                  setState(() {
                    certGasSalidaSi = si ?? false;
                    certGasSalidaNo = !certGasSalidaSi;
                  });
                },
                onCertGasNoChanged: (bool? no) {
                  setState(() {
                    certGasSalidaNo = no ?? false;
                    certGasSalidaSi = !certGasSalidaNo;
                  });
                },
                onOtrosDocumentosChanged: (String value) {
                  setState(() {
                    otrosDocumentosSalida = value;
                  });
                },
              ),
              SizedBox(height: 20),
              Text('ENTREGA DE TALLER:'),
              TextField(
                decoration: InputDecoration(labelText: 'NOMBRE'),
                onChanged: (value) {
                  setState(() {
                    entregaTallerNombre = value;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _imprimirInventario,
                child: Text('Imprimir Inventario'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _imprimirInventario() async {
    List<Map<String, dynamic>> inventario = obtenerDatosInventario();
    final pdfBytes = await generarContenidoParaImprimir(inventario);
    Printing.layoutPdf(onLayout: (_) => pdfBytes);
  }

  List<Map<String, dynamic>> obtenerDatosInventario() {
    // Reemplaza esto con tu lógica para obtener los datos del inventario
    return [
      {'vehiculo': 'Vehículo 1', 'marca': 'Marca 1', 'modelo': 'Modelo 1'},
      {'vehiculo': 'Vehículo 2', 'marca': 'Marca 2', 'modelo': 'Modelo 2'},
      // ... más datos del inventario ...
    ];
  }

  Future<Uint8List> generarContenidoParaImprimir(List<Map<String, dynamic>> inventario) async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text('INVENTARIO DE VEHÍCULOS', style: pw.TextStyle(fontSize: 20)),
              pw.SizedBox(height: 20),
              for (var vehiculo in inventario) ...[
                pw.Text('Vehículo: ${vehiculo['vehiculo']}'),
                pw.Text('Marca: ${vehiculo['marca']}'),
                pw.Text('Modelo: ${vehiculo['modelo']}'),
                pw.SizedBox(height: 10),
              ],
            ],
          );
        },
      ),
    );
    return pdf.save();
  }

  // Función para construir una fila de documento
  Widget _buildDocumentoRow(BuildContext context, String nombreDocumento, bool siValue, bool noValue, Function(bool?) onSiChanged, Function(bool?) onNoChanged, {bool fechaVencimiento = false}) {
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