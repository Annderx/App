import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'ClasesEmpleados.dart';

class EmpleadoProvider extends ChangeNotifier {
  List<Empleado> _empleados = [];
  late Database _database;

  List<Empleado> get empleados => _empleados;

  EmpleadoProvider() {
    _initDB();
  }

  Future<void> _initDB() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'empleados.db'),
      onCreate: (db, version) {
        return db.execute(
          '''CREATE TABLE empleados(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            codigo TEXT,
            nombre TEXT,
            area TEXT,
            tipo TEXT,
            funcion TEXT,
            condicion TEXT,
            telefono TEXT,
            dni TEXT,
            direccion TEXT,
            sueldo REAL,
            edad INTEGER,
            fechaNacimiento TEXT
          )''',
        );
      },
      version: 1,
    );
    await obtenerEmpleados();
  }

  Future<void> agregarEmpleado(Empleado empleado) async {
    await _database.insert('empleados', empleado.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    await obtenerEmpleados();
  }

  Future<void> obtenerEmpleados() async {
    final List<Map<String, dynamic>> empleadosMap = await _database.query('empleados');
    _empleados = empleadosMap.map((e) => Empleado.fromMap(e)).toList();
    notifyListeners();
  }

  Future<void> actualizarEmpleado(Empleado empleado) async {
    await _database.update(
      'empleados',
      empleado.toMap(),
      where: 'id = ?',
      whereArgs: [empleado.id],
    );
    await obtenerEmpleados();
  }

  Future<void> eliminarEmpleado(int id) async {
    await _database.delete(
      'empleados',
      where: 'id = ?',
      whereArgs: [id],
    );
    await obtenerEmpleados();
  }
}
