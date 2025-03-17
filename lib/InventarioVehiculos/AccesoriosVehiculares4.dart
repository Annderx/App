import 'package:flutter/material.dart';
import 'package:myapp/InventarioVehiculos/AccesoriosVehiculares5.dart';

class AccesoriosVehicularesContinuacion5Screen extends StatefulWidget {
  const AccesoriosVehicularesContinuacion5Screen({super.key});

  @override
  _AccesoriosVehicularesContinuacion5ScreenState createState() =>
      _AccesoriosVehicularesContinuacion5ScreenState();
}

class _AccesoriosVehicularesContinuacion5ScreenState
    extends State<AccesoriosVehicularesContinuacion5Screen> {
  // ... (Aquí irán las variables de estado y la lógica) ...
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
              _buildAccesorioRow(context, '-LIBRETA DE CONTROL:'),
              _buildAccesorioRow(context, '-TAPITAS DE RUEDAS:'),
              _buildAccesorioRow(context, '-TUERCAS DE RUEDA:'),
              _buildAccesorioRow(context, '-BATERIA POSTERIOR:'),
              _buildAccesorioRow(context, '-TARJETA DE PROPIEDAD:'),
              _buildAccesorioRow(context, '-FARO DELANTERO (LH-IZQ)'),
              _buildAccesorioRow(context, '-FARO DELANTERO (RH-DER)'),
              _buildAccesorioRow(context, '-SEGUROS DE FARO DELANTERO:'),
              _buildAccesorioRow(context, '-FAROS NEBLINEROS:'),
              _buildAccesorioRow(context, '-PARABRISAS DELANTERO:'),
              _buildAccesorioRow(context, '-PARACHOQUE DELANTERO:'),
              _buildAccesorioRow(context, '-CAPOT:'),
              _buildAccesorioRow(context, '-SOPORTE/ AMORTIGUADOR CAPOT:'),
              _buildAccesorioRow(context, '-GUARDAFANGO DELANTERO LH:'),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Volver a la pantalla anterior
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
                                  AccesoriosVehicularesContinuacion6Screen(),
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
