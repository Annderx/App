import 'package:flutter/material.dart';
import 'package:myapp/InventarioVehiculos/AccesoriosVehiculares2.dart';

// ... (InventarioVehicularScreen, _InventarioVehicularScreenState, AccesoriosVehicularesScreen, _AccesoriosVehicularesScreenState, AccesoriosVehicularesContinuacionScreen, _AccesoriosVehicularesContinuacionScreenState) ...

class AccesoriosVehicularesContinuacion2Screen extends StatefulWidget {
  const AccesoriosVehicularesContinuacion2Screen({super.key});

  @override
  _AccesoriosVehicularesContinuacion2ScreenState createState() =>
      _AccesoriosVehicularesContinuacion2ScreenState();
}

class _AccesoriosVehicularesContinuacion2ScreenState
    extends State<AccesoriosVehicularesContinuacion2Screen> {
  // Variables de estado para los accesorios
  bool espejoExteriorSi = false;
  String espejoExteriorEstado = 'Seleccione';
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
              _buildAccesorioRow(context, '-ESPEJO EXTERIOR:'),
              _buildAccesorioRow(context, '-PARLANTES:'),
              _buildAccesorioRow(context, '-ALARMA(LLAVERO):'),
              _buildAccesorioRow(context, '-TAPASOL:'),
              _buildAccesorioRow(context, '-LLANTAS Y ARO ALUMINIO:'),
              _buildAccesorioRow(context, '-LLANTA REPUESTO:'),
              _buildAccesorioRow(context, '-PLUMILLAS Y BRAZOS:'),
              _buildAccesorioRow(context, '-FARO PIRATA DE TECHO:'),
              _buildAccesorioRow(context, '-SIRENAS CON MICROFONO:'),
              _buildAccesorioRow(context, '-BARRAS DE LUCES CIRCULINA:'),
              _buildAccesorioRow(context, '-BATERIA DELANTERA:'),
              _buildAccesorioRow(context, '-TAPA DE RADIADOR:'),
              _buildAccesorioRow(context, '-TAPA DE ACEITE DE MOTOR:'),
              _buildAccesorioRow(context, '-TAPA LIQUIDO FRENO:'),
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
                                  AccesoriosVehicularesContinuacion3Screen(),
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
