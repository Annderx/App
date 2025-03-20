import 'package:flutter/material.dart';
import 'package:myapp/InventarioVehiculos/ControlDeIngreso.dart';

class AccesoriosVehicularesContinuacion8Screen extends StatefulWidget {
  const AccesoriosVehicularesContinuacion8Screen({super.key});

  @override
  _AccesoriosVehicularesContinuacion8ScreenState createState() =>
      _AccesoriosVehicularesContinuacion8ScreenState();
}

class _AccesoriosVehicularesContinuacion8ScreenState
    extends State<AccesoriosVehicularesContinuacion8Screen> {
  final List<String> accesorios = [
    'Tapices de Asiento',
    'Guantera de Tablero',
    'Manijas de Puertas Interiores RH',
    'Manijas de Puertas Interiores LH',
    'Seguro de Ruedas',
    'Taco de Madera',
    'Triángulo de Seguridad',
    'Micrófono de Radio Común',
    'Parlante de Radio Común',
    'Tolva Posterior',
    'Techo',
  ];

  final Map<String, bool> accesoriosDisponibles = {};
  final Map<String, String> accesoriosEstado = {};
  String observaciones = '';

  @override
  void initState() {
    super.initState();
    for (var accesorio in accesorios) {
      accesoriosDisponibles[accesorio] = false;
      accesoriosEstado[accesorio] = 'Seleccione';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accesorios Vehiculares'),
        centerTitle: true,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Seleccione los accesorios disponibles y su estado:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: accesorios.length,
                itemBuilder: (context, index) {
                  final accesorio = accesorios[index];
                  return _buildAccesorioCard(accesorio);
                },
              ),
            ),
            const SizedBox(height: 20),
            _buildObservacionesField(),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Atrás'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[600],
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ControlIngresoScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.check_circle_outline),
                  label: const Text('Control de ingreso'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAccesorioCard(String accesorio) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Icon(
                Icons.settings_applications,
                color: accesoriosDisponibles[accesorio]! ? Colors.green : Colors.red,
              ),
              title: Text(
                accesorio,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              trailing: Switch(
                value: accesoriosDisponibles[accesorio]!,
                onChanged: (value) {
                  setState(() {
                    accesoriosDisponibles[accesorio] = value;
                  });
                },
              ),
            ),
            if (accesoriosDisponibles[accesorio]!)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: 'Estado'),
                  value: accesoriosEstado[accesorio],
                  items: ['Seleccione', 'Bueno', 'Roto', 'No Funciona']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      accesoriosEstado[accesorio] = value!;
                    });
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildObservacionesField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Observaciones:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        TextField(
          maxLines: 3,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            hintText: 'Ingrese detalles adicionales...',
          ),
          onChanged: (value) {
            setState(() {
              observaciones = value;
            });
          },
        ),
      ],
    );
  }
}
