import 'package:flutter/material.dart';
import 'ClasesUsuarios.dart';

class UsuarioProvider with ChangeNotifier {
  final List<Usuario> _usuarios = [];

  List<Usuario> get usuarios => _usuarios;

  void agregarUsuario(Usuario usuario) {
    _usuarios.add(usuario);
    notifyListeners();
  }

  // Métodos adicionales para cargar datos desde una API o base de datos
  // ...
}