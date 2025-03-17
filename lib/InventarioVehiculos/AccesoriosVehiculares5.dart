import 'package:flutter/material.dart';
import 'package:myapp/InventarioVehiculos/AccesoriosVehiculares6.dart';

// ... (InventarioVehicularScreen, _InventarioVehicularScreenState, AccesoriosVehicularesScreen, _AccesoriosVehicularesScreenState, AccesoriosVehicularesContinuacionScreen, _AccesoriosVehicularesContinuacionScreenState, AccesoriosVehicularesContinuacion2Screen, _AccesoriosVehicularesContinuacion2ScreenState, AccesoriosVehicularesContinuacion3Screen, _AccesoriosVehicularesContinuacion3ScreenState, AccesoriosVehicularesContinuacion4Screen, _AccesoriosVehicularesContinuacion4ScreenState, AccesoriosVehicularesContinuacion5Screen, _AccesoriosVehicularesContinuacion5ScreenState) ...

class AccesoriosVehicularesContinuacion6Screen extends StatefulWidget {
  const AccesoriosVehicularesContinuacion6Screen({super.key});

  @override
  _AccesoriosVehicularesContinuacion6ScreenState createState() =>
      _AccesoriosVehicularesContinuacion6ScreenState();
}

class _AccesoriosVehicularesContinuacion6ScreenState
    extends State<AccesoriosVehicularesContinuacion6Screen> {
  // Variables de estado para los accesorios
  bool puertaDelanteraLHSi = false;
  String puertaDelanteraLHEstado = 'Seleccione';
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
              _buildAccesorioRow(context, '-PUERTA DELANTERA LH:'),
              _buildAccesorioRow(context, '-PUERTA POSTERIOR LH:'),
              _buildAccesorioRow(context, '-LUNAS LATERALES LH:'),
              _buildAccesorioRow(context, '-GUARDAFANGO POSTERIOR LH:'),
              _buildAccesorioRow(context, '-VASOS DE RUEDA RH:'),
              _buildAccesorioRow(context, '-MANIJAS DE PUERTAS EXTERIORES:'),
              _buildAccesorioRow(context, '-GUARDAFANGO DELANTERO RH:'),
              _buildAccesorioRow(context, '-PUERTA DELANTERA RH:'),
              _buildAccesorioRow(context, '-PUERTA POSTERIOR RH:'),
              _buildAccesorioRow(context, '-LUNAS LATERALES RH:'),
              _buildAccesorioRow(context, '-GUARDAFANGO POSTERIOR RH:'),
              _buildAccesorioRow(context, '-VASOS DE RUEDA RH:'),
              _buildAccesorioRow(context, '-MANIJAS DE PUERTA EXTERIORES:'),
              _buildAccesorioRow(context, '-FAROS DIRECCIONALES:'),
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
                                  AccesoriosVehicularesContinuacion7Screen(),
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
