import 'package:flutter/material.dart';
import 'package:myapp/InventarioVehiculos/AccesoriosVehiculares3.dart';

// ... (InventarioVehicularScreen, _InventarioVehicularScreenState, AccesoriosVehicularesScreen, _AccesoriosVehicularesScreenState, AccesoriosVehicularesContinuacionScreen, _AccesoriosVehicularesContinuacionScreenState, AccesoriosVehicularesContinuacion2Screen, _AccesoriosVehicularesContinuacion2ScreenState) ...

class AccesoriosVehicularesContinuacion3Screen extends StatefulWidget {
  const AccesoriosVehicularesContinuacion3Screen({super.key});

  @override
  _AccesoriosVehicularesContinuacion3ScreenState createState() =>
      _AccesoriosVehicularesContinuacion3ScreenState();
}

class _AccesoriosVehicularesContinuacion3ScreenState
    extends State<AccesoriosVehicularesContinuacion3Screen> {
  // Variables de estado para los accesorios
  bool tapaTanqueAuxRadSi = false;
  String tapaTanqueAuxRadEstado = 'Seleccione';
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
              _buildAccesorioRow(context, '-TAPA DE TANQUE AUX. RAD.:'),
              _buildAccesorioRow(context, '-LAPIZ TACTIL DE LAP TOP:'),
              _buildAccesorioRow(context, '-TAPA LIMPIA PARABRIZA:'),
              _buildAccesorioRow(context, '-TAPA DEPOSITO HIDRAULICO:'),
              _buildAccesorioRow(context, '-TAPA TANQUE GASOLINA:'),
              _buildAccesorioRow(context, '-VARILLA DE ACEITE DE MOTOR:'),
              _buildAccesorioRow(context, '-PORTA RELAY:'),
              _buildAccesorioRow(context, '-PORTA PUSIBLES:'),
              _buildAccesorioRow(context, '-CLAXON:'),
              _buildAccesorioRow(context, '-BOTIQUIN:'),
              _buildAccesorioRow(context, '-CABLE DE AUX. ELECT.:'),
              _buildAccesorioRow(context, '-CABLE DE REMOLQUE:'),
              _buildAccesorioRow(context, '-MALLA DE NYLON NEGRO:'),
              _buildAccesorioRow(context, '-MALETIN CON 06 ACCES LUCES:'),
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
                                  AccesoriosVehicularesContinuacion4Screen(),
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
