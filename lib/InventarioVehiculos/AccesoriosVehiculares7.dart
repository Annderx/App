import 'package:flutter/material.dart';
import 'package:myapp/InventarioVehiculos/ControlDeIngreso.dart';

// ... (InventarioVehicularScreen, _InventarioVehicularScreenState, AccesoriosVehicularesScreen, _AccesoriosVehicularesScreenState, AccesoriosVehicularesContinuacionScreen, _AccesoriosVehicularesContinuacionScreenState, AccesoriosVehicularesContinuacion2Screen, _AccesoriosVehicularesContinuacion2ScreenState, AccesoriosVehicularesContinuacion3Screen, _AccesoriosVehicularesContinuacion3ScreenState, AccesoriosVehicularesContinuacion4Screen, _AccesoriosVehicularesContinuacion4ScreenState, AccesoriosVehicularesContinuacion5Screen, _AccesoriosVehicularesContinuacion5ScreenState, AccesoriosVehicularesContinuacion6Screen, _AccesoriosVehicularesContinuacion6ScreenState, AccesoriosVehicularesContinuacion7Screen, _AccesoriosVehicularesContinuacion7ScreenState) ...

class AccesoriosVehicularesContinuacion8Screen extends StatefulWidget {
  const AccesoriosVehicularesContinuacion8Screen({super.key});

  @override
  _AccesoriosVehicularesContinuacion8ScreenState createState() =>
      _AccesoriosVehicularesContinuacion8ScreenState();
}

class _AccesoriosVehicularesContinuacion8ScreenState
    extends State<AccesoriosVehicularesContinuacion8Screen> {
  // Variables de estado para los accesorios
  bool tapicesAsientoSi = false;
  String tapicesAsientoEstado = 'Seleccione';
  String observaciones = '';
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
              _buildAccesorioRow(context, '-TAPICES DE ASIENTO:'),
              _buildAccesorioRow(context, '-GUANTERA DE TABLERO:'),
              _buildAccesorioRow(context, '-MANIJAS DE PUERTAS INTERIORES RH:'),
              _buildAccesorioRow(context, '-MANIJAS DE PUERTAS INTERIORES LH:'),
              _buildAccesorioRow(context, '-SEGURO DE RUEDAS:'),
              _buildAccesorioRow(context, '-TACO DE MADERA:'),
              _buildAccesorioRow(context, '-TRIANGULO DE SEGURIDAD:'),
              _buildAccesorioRow(context, '-MICROFONO DE RADIO COMUN:'),
              _buildAccesorioRow(context, '-PARLANTE DE RADIO COMUN:'),
              _buildAccesorioRow(context, '-TOLVA POSTERIOR:'),
              _buildAccesorioRow(context, '-TECHO:'),
              SizedBox(height: 20),
              Text('OBSERVACIONES:'),
              TextField(
                maxLines: 3,
                decoration: InputDecoration(border: OutlineInputBorder()),
                onChanged: (value) {
                  setState(() {
                    observaciones = value;
                  });
                },
              ),
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
                          builder: (context) => ControlIngresoScreen(),
                        ),
                      );
                    },
                    child: Text('Control de ingreso'),
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
