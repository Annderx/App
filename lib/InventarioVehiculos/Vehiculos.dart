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
      theme: ThemeData(primarySwatch: Colors.blue),
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
        title: Text('SECCION DEL INVENTARIO VEHICULAR'),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'INVENTARIO DE VEHICULO',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Expanded(child: Text('NO INVENTARIO:')),
                  Expanded(child: Text('FECHA Y HORA: $_fechaHora')),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Expanded(child: Text('RUC: 20474979068')),
                  Expanded(
                    child: Text('TALLER: SERVICIOS DIESEL GASTULO S.R.L'),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Expanded(child: Text('RESPONSABLE DE TALLER:')),
                  Expanded(
                    child: DropdownButton<String>(
                      items:
                          <String>[
                            'Seleccione',
                            'Juan Perez',
                            'Maria Garcia',
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                      onChanged: (_) {},
                      value: 'Seleccione',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Expanded(child: Text('UNIDAD USUARIA:')),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                  Expanded(child: Text('HORA INGRESO:')),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                  Expanded(child: Text('KM INGRESO:')),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                'DIRECCION DE TALLER: CALLE 3 MZ ALT.5 PROYECTO TAMBO INGA 191-PUENTE PIEDRA',
              ),
              SizedBox(height: 20),
              Text(
                'DATOS CLIENTE:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Expanded(child: Text('TIPO DE CLIENTE:')),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                  Expanded(child: Text('RUC:')),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Expanded(child: Text('RAZON SOCIAL:')),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Expanded(child: Text('CELULAR:')),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                  Expanded(child: Text('EMAIL:')),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'DATOS VEHICULO:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Expanded(child: Text('TIPO:')),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                  Expanded(child: Text('VIN:')),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Expanded(child: Text('MARCA:')),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                  Expanded(child: Text('MODELO:')),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Expanded(child: Text('PLACA:')),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                  Expanded(child: Text('COMBUSTIBLE:')),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Expanded(child: Text('AÑO FAB.:')),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                  Expanded(child: Text('AÑO MOD.:')),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AccesoriosVehicularesScreen(),
                      ),
                    );
                  },
                  child: Text('SIGUIENTE'),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(_fechaHora, textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
