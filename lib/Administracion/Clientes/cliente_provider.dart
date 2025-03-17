import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'ClasesClientes.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  late Database database;

  DatabaseHelper() {
    _initDatabase();
  }

  Future<void> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'prueba_database.db');
    database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE clientes (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            codigo TEXT NOT NULL,
            razonSocial TEXT NOT NULL,
            direccion TEXT NOT NULL,
            tipoCliente TEXT,
            esRuc INTEGER NOT NULL,
            ruc TEXT,
            dni TEXT,
            tipoContacto TEXT,
            contacto TEXT,
            telefono TEXT,
            celular TEXT,
            correo TEXT
          )
        ''');
      },
    );
  }

  Future<void> close() async {
    await database.close();
  }
}

class ClienteProvider with ChangeNotifier {
  final DatabaseHelper dbHelper = DatabaseHelper();

  ClienteProvider() {
    initialize();
  }

  Future<void> initialize() async {
    await dbHelper._initDatabase();
  }

  Future<void> insertarCliente(Cliente cliente) async {
    try {
      await dbHelper.database.insert('clientes', cliente.toMap());
      notifyListeners();
    } catch (e) {
      print('Error al insertar cliente: $e');
    }
  }

  Future<List<Cliente>> leerClientes({String? filtro}) async {
    try {
      final List<Map<String, dynamic>> maps = filtro == null
          ? await dbHelper.database.query('clientes')
          : await dbHelper.database.query(
              'clientes',
              where: 'razonSocial LIKE ?',
              whereArgs: ['%$filtro%'],
            );
      return List.generate(maps.length, (i) {
        return Cliente(
          id: maps[i]['id'],
          codigo: maps[i]['codigo'],
          razonSocial: maps[i]['razonSocial'],
          direccion: maps[i]['direccion'],
          tipoCliente: maps[i]['tipoCliente'],
          esRuc: maps[i]['esRuc'] == 1,
          ruc: maps[i]['ruc'],
          dni: maps[i]['dni'],
          tipoContacto: maps[i]['tipoContacto'],
          contacto: maps[i]['contacto'],
          telefono: maps[i]['telefono'],
          celular: maps[i]['celular'],
          correo: maps[i]['correo'],
        );
      });
    } catch (e) {
      print('Error al leer clientes: $e');
      return [];
    }
  }

  Future<Cliente?> obtenerCliente(String codigo) async {
    try {
      final List<Map<String, dynamic>> maps = await dbHelper.database.query(
        'clientes',
        where: 'codigo = ?',
        whereArgs: [codigo],
      );
      if (maps.isNotEmpty) {
        return Cliente(
          id: maps[0]['id'],
          codigo: maps[0]['codigo'],
          razonSocial: maps[0]['razonSocial'],
          direccion: maps[0]['direccion'],
          tipoCliente: maps[0]['tipoCliente'],
          esRuc: maps[0]['esRuc'] == 1,
          ruc: maps[0]['ruc'],
          dni: maps[0]['dni'],
          tipoContacto: maps[0]['tipoContacto'],
          contacto: maps[0]['contacto'],
          telefono: maps[0]['telefono'],
          celular: maps[0]['celular'],
          correo: maps[0]['correo'],
        );
      }
      return null;
    } catch (e) {
      print('Error al obtener cliente: $e');
      return null;
    }
  }

  Future<void> eliminarCliente(String codigo) async {
    try {
      await dbHelper.database
          .delete('clientes', where: 'codigo = ?', whereArgs: [codigo]);
      notifyListeners();
    } catch (e) {
      print('Error al eliminar cliente: $e');
    }
  }

  Future<void> actualizarCliente(Cliente cliente) async {
    try {
      await dbHelper.database.update(
        'clientes',
        cliente.toMap(),
        where: 'codigo = ?',
        whereArgs: [cliente.codigo],
      );
      notifyListeners();
    } catch (e) {
      print('Error al actualizar cliente: $e');
    }
  }

  @override
  void dispose() {
    dbHelper.close();
    super.dispose();
  }
}
