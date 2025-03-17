import 'package:flutter/material.dart';
import 'package:myapp/InventarioVehiculos/AccesoriosVehiculares7.dart';

// ... (InventarioVehicularScreen, _InventarioVehicularScreenState, AccesoriosVehicularesScreen, _AccesoriosVehicularesScreenState, AccesoriosVehicularesContinuacionScreen, _AccesoriosVehicularesContinuacionScreenState, AccesoriosVehicularesContinuacion2Screen, _AccesoriosVehicularesContinuacion2ScreenState, AccesoriosVehicularesContinuacion3Screen, _AccesoriosVehicularesContinuacion3ScreenState, AccesoriosVehicularesContinuacion4Screen, _AccesoriosVehicularesContinuacion4ScreenState, AccesoriosVehicularesContinuacion5Screen, _AccesoriosVehicularesContinuacion5ScreenState, AccesoriosVehicularesContinuacion6Screen, _AccesoriosVehicularesContinuacion6ScreenState) ...

class AccesoriosVehicularesContinuacion7Screen extends StatefulWidget {
  const AccesoriosVehicularesContinuacion7Screen({super.key});

  @override
  _AccesoriosVehicularesContinuacion7ScreenState createState() =>
      _AccesoriosVehicularesContinuacion7ScreenState();
}

class _AccesoriosVehicularesContinuacion7ScreenState
    extends State<AccesoriosVehicularesContinuacion7Screen> {
  // Variables de estado para los accesorios
  bool sistemaLimpiaParabrisasSi = false;
  String sistemaLimpiaParabrisasEstado = 'Seleccione';
  // ... (variables para otros accesorios) ...

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ACCESORIOS VEHICULARES')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'ACCESORIOS VEHICULARES:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              _buildAccesorioRow(context, '-SISTEMA LIMPIAPARABRISAS:'),
              _buildAccesorioRow(context, '-ALARMA DE RETROCESO:'),
              _buildAccesorioRow(context, '-TAPA DE COMBUSTIBLE:'),
              _buildAccesorioRow(context, '-LLAVE DE TAPA COMBUSTIBLE:'),
              _buildAccesorioRow(context, '-PARABRISAS POSTERIOR:'),
              _buildAccesorioRow(context, '-MALETERA POSTERIOR:'),
              _buildAccesorioRow(context, '-PUERTA POSTERIOR:'),
              _buildAccesorioRow(
                context,
                '-AMORTIGUADORES DE PUERTA POSTERIOR:',
              ),
              _buildAccesorioRow(context, '-PARACHOQUE POSTERIOR:'),
              _buildAccesorioRow(context, '-FARO POSTERIOR LH:'),
              _buildAccesorioRow(context, '-FARO POSTERIOR RH:'),
              _buildAccesorioRow(context, '-SEGUROS DE FAROS POSTERIORES:'),
              _buildAccesorioRow(context, '-ENCENDEDOR(MACHO):'),
              _buildAccesorioRow(context, '-ENCENDEDOR(HEMBRA):'),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('ATRAS'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) =>
                                  AccesoriosVehicularesContinuacion8Screen(),
                        ),
                      );
                    },
                    child: Text('SIGUIENTE'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAccesorioRow(BuildContext context, String nombreAccesorio) {
    return Row(
      children: <Widget>[
        Text(nombreAccesorio),
        Checkbox(value: false, onChanged: (bool? value) {}),
        Text('SI'),
        Checkbox(value: true, onChanged: (bool? value) {}),
        SizedBox(width: 20),
        DropdownButton<String>(
          items:
              <String>['Seleccione', 'Bueno', 'Roto', 'No Funciona'].map((
                String value,
              ) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
          onChanged: (_) {},
          value: 'Seleccione',
        ),
      ],
    );
  }
}
