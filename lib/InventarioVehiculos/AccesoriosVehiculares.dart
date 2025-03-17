import 'package:flutter/material.dart';
import 'package:myapp/InventarioVehiculos/AccesoriosVehiculares1.dart';

// ... (InventarioVehicularScreen y _InventarioVehicularScreenState) ...

class AccesoriosVehicularesScreen extends StatefulWidget {
  const AccesoriosVehicularesScreen({super.key});

  @override
  _AccesoriosVehicularesScreenState createState() =>
      _AccesoriosVehicularesScreenState();
}

class _AccesoriosVehicularesScreenState
    extends State<AccesoriosVehicularesScreen> {
  // Variables de estado para los accesorios
  bool llaveContactoSi = false;
  String llaveContactoEstado = 'Seleccione';
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
              _buildAccesorioRow(context, '-LLAVE DE CONTACTO:'),
              _buildAccesorioRow(context, '-RADIO MP3 FABRICA:'),
              _buildAccesorioRow(context, '-CONTROL DE HUELLAS:'),
              _buildAccesorioRow(context, '-PANEL DE COMANDO:'),
              _buildAccesorioRow(context, '-CAMARA DE VIDEOS:'),
              _buildAccesorioRow(context, '-CENICERO:'),
              _buildAccesorioRow(context, '-LAP TOP CON RACK:'),
              _buildAccesorioRow(context, '-LUCES DE SALON:'),
              _buildAccesorioRow(context, '-AGARRADERAS INTERIOR:'),
              _buildAccesorioRow(context, '-ASIENTOS VEHICULAR:'),
              _buildAccesorioRow(context, '-CABEZALES:'),
              _buildAccesorioRow(context, '-CINTURON DE SEGURIDAD:'),
              _buildAccesorioRow(context, '-A/C Y CALEFACCION:'),
              _buildAccesorioRow(context, '-ESPEJO INTERIOR:'),
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
                                  AccesoriosVehicularesContinuacion2Screen(),
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
        Text('NO'),
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
