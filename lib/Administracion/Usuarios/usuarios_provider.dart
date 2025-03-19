import 'package:flutter/material.dart';
import 'ClasesUsuarios.dart';

class UsuarioProvider with ChangeNotifier {
  final List<Usuario> _usuarios = [];

  List<Usuario> get usuarios => List.unmodifiable(_usuarios);

  void agregarUsuario(Usuario usuario) {
    _usuarios.add(usuario);
    notifyListeners();
  }

  void eliminarUsuario(int id) {
    _usuarios.removeWhere((usuario) => usuario.id == id);
    notifyListeners();
  }

  void actualizarUsuario(int id, String nuevoNombre, String nuevoTipo) {
    int index = _usuarios.indexWhere((usuario) => usuario.id == id);
    if (index != -1) {
      _usuarios[index] = Usuario(
        id: id,
        codigoUsuario: _usuarios[index].codigoUsuario,
        nombre: nuevoNombre,
        codigoEmpleado: _usuarios[index].codigoEmpleado,
        tipoUsuario: nuevoTipo,
        nombreUsuario: _usuarios[index].nombreUsuario,
        contrasena: _usuarios[index].contrasena,
      );
      notifyListeners();
    }
  }
}
