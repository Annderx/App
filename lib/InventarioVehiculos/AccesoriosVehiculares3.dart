import 'package:flutter/material.dart';
import 'package:myapp/InventarioVehiculos/AccesoriosVehiculares4.dart';

// ... (InventarioVehicularScreen, _InventarioVehicularScreenState, AccesoriosVehicularesScreen, _AccesoriosVehicularesScreenState, AccesoriosVehicularesContinuacionScreen, _AccesoriosVehicularesContinuacionScreenState, AccesoriosVehicularesContinuacion2Screen, _AccesoriosVehicularesContinuacion2ScreenState, AccesoriosVehicularesContinuacion3Screen, _AccesoriosVehicularesContinuacion3ScreenState) ...

class AccesoriosVehicularesContinuacion4Screen extends StatefulWidget {
  const AccesoriosVehicularesContinuacion4Screen({super.key});

  @override
  _AccesoriosVehicularesContinuacion4ScreenState createState() =>
      _AccesoriosVehicularesContinuacion4ScreenState();
}

class _AccesoriosVehicularesContinuacion4ScreenState
    extends State<AccesoriosVehicularesContinuacion4Screen> {
  // Variables de estado para los accesorios
  bool radioComunicacionSi = false;
  String radioComunicacionEstado = 'Seleccione';
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
              _buildAccesorioRow(context, '-RADIO DE COMUNICACION:'),
              _buildAccesorioRow(context, '-ESTUCHE DE HERRAMIENTAS:'),
              _buildAccesorioRow(context, '-PISOS DE JEBE:'),
              _buildAccesorioRow(context, '-CONOS DE SEGURIDAD:'),
              _buildAccesorioRow(context, '-EXTINTOR:'),
              _buildAccesorioRow(context, '-GATA DE CASTILLA:'),
              _buildAccesorioRow(context, '-PALANCA DE GATA:'),
              _buildAccesorioRow(context, '-LLAVE DE RUEDAS:'),
              _buildAccesorioRow(context, '-GANCHO DE REMOLQUE:'),
              _buildAccesorioRow(context, '-MANUAL DE PROPIETARIO:'),
              _buildAccesorioRow(context, '-PASAPORTE DE SERVICIO:'),
              _buildAccesorioRow(context, '-CONTROL REMOTO DE FARO:'),
              _buildAccesorioRow(context, '-ANTENAS:'),
              _buildAccesorioRow(context, '-SOAT:'),
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
                                  AccesoriosVehicularesContinuacion5Screen()
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

