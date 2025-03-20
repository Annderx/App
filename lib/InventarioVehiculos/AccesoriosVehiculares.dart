import 'package:flutter/material.dart';
import 'package:myapp/InventarioVehiculos/AccesoriosVehiculares1.dart';

class AccesoriosVehicularesScreen extends StatefulWidget {
  const AccesoriosVehicularesScreen({super.key});

  @override
  _AccesoriosVehicularesScreenState createState() =>
      _AccesoriosVehicularesScreenState();
}

class _AccesoriosVehicularesScreenState
    extends State<AccesoriosVehicularesScreen> {
  final List<String> accesorios = [
    'Llave de Contacto',
    'Radio MP3 Fábrica',
    'Control de Huellas',
    'Panel de Comando',
    'Cámara de Video',
    'Cenicero',
    'Lap Top con Rack',
    'Luces de Salón',
    'Agarraderas Interior',
    'Asientos Vehicular',
    'Cabezal',
    'Cinturón de Seguridad',
    'A/C y Calefacción',
    'Espejo Interior',
  ];

  final Map<String, bool> accesoriosDisponibles = {};
  final Map<String, String> accesoriosEstado = {};

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
                        builder: (context) =>
                            AccesoriosVehicularesContinuacion2Screen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.arrow_forward),
                  label: const Text('Siguiente'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
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
                Icons.build,
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
}
