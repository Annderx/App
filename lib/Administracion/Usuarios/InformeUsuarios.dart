import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'usuarios_provider.dart';

class InformeUsuarios extends StatelessWidget {
  const InformeUsuarios({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioProvider = Provider.of<UsuarioProvider>(context);
    final usuarios = usuarioProvider.usuarios;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Informe de Usuarios'), // Descripción corregida
      ),
      body: ListView.builder(
        itemCount: usuarios.length,
        itemBuilder: (context, index) {
          final usuario = usuarios[index];
          return ListTile(
            title: Text(usuario.nombre),
            subtitle: Text('Usuario: ${usuario.nombreUsuario}, Tipo: ${usuario.tipoUsuario}'),
            trailing: Text('ID: ${usuario.id}'),
          );
        },
      ),
    );
  }
}