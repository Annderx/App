import 'package:flutter/material.dart';
import 'ClasesUsuarios.dart';

class UsuarioProvider with ChangeNotifier {
  final Map<int, Usuario> _usuarios = {}; // Cambiado a Map para búsquedas más rápidas

  List<Usuario> get usuarios => _usuarios.values.toList();

  void agregarUsuario(Usuario usuario) {
    _usuarios[usuario.id] = usuario;
    notifyListeners();
  }

  void eliminarUsuario(int id) {
    _usuarios.remove(id);
    notifyListeners();
  }

  void actualizarUsuario(Usuario usuario) {
    if (_usuarios.containsKey(usuario.id)) {
      _usuarios[usuario.id] = usuario;
      notifyListeners();
    }
  }

  Usuario? obtenerUsuarioPorId(int id) {
    return _usuarios[id];
  }

  // Métodos adicionales para cargar y guardar en una base de datos
  Future<void> cargarUsuariosDesdeDB() async {
    // Simulación de carga de datos desde una API o BD
    await Future.delayed(const Duration(seconds: 1));
    _usuarios.clear();
    _usuarios[1] = Usuario(
      id: 1,
      codigoUsuario: 'USR-001',
      nombre: 'Juan Pérez',
      codigoEmpleado: 'EMP-100',
      tipoUsuario: 'Administrador',
      nombreUsuario: 'jperez',
      contrasena: '123456',
    );
    notifyListeners();
  }
}
