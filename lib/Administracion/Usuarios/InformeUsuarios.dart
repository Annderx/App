import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'usuarios_provider.dart';
import 'ClasesUsuarios.dart';

class InformeUsuarios extends StatefulWidget {
  const InformeUsuarios({super.key});

  @override
  State<InformeUsuarios> createState() => _InformeUsuariosState();
}

class _InformeUsuariosState extends State<InformeUsuarios> {
  String _searchText = "";

  @override
  Widget build(BuildContext context) {
    final usuarioProvider = Provider.of<UsuarioProvider>(context);
    final usuarios = usuarioProvider.usuarios
        .where((usuario) => usuario.nombre.toLowerCase().contains(_searchText.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Informe de Usuarios'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Buscar usuario...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onChanged: (value) {
                setState(() {
                  _searchText = value;
                });
              },
            ),
          ),
          Expanded(
            child: usuarios.isEmpty
                ? const Center(child: Text('No hay usuarios registrados'))
                : ListView.builder(
                    itemCount: usuarios.length,
                    itemBuilder: (context, index) {
                      final usuario = usuarios[index];
                      return Card(
                        elevation: 3,
                        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: ListTile(
                          title: Text(usuario.nombre, style: const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text('Usuario: ${usuario.nombreUsuario} • Tipo: ${usuario.tipoUsuario}'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit, color: Colors.blue),
                                onPressed: () => _editarUsuario(context, usuario, usuarioProvider),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete, color: Colors.red),
                                onPressed: () => _confirmarEliminar(context, usuario, usuarioProvider),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  void _editarUsuario(BuildContext context, Usuario usuario, UsuarioProvider usuarioProvider) {
    final _nombreController = TextEditingController(text: usuario.nombre);
    final _tipoUsuarioController = TextEditingController(text: usuario.tipoUsuario);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Editar Usuario'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: _nombreController, decoration: const InputDecoration(labelText: 'Nombre')),
              TextField(controller: _tipoUsuarioController, decoration: const InputDecoration(labelText: 'Tipo de Usuario')),
            ],
          ),
          actions: [
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              child: const Text('Guardar'),
              onPressed: () {
                usuarioProvider.actualizarUsuario(
                  usuario.id, // ✅ Se asegura que `id` no sea nulo
                  _nombreController.text,
                  _tipoUsuarioController.text,
                );
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _confirmarEliminar(BuildContext context, Usuario usuario, UsuarioProvider usuarioProvider) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Eliminar Usuario'),
          content: Text('¿Estás seguro de eliminar a ${usuario.nombre}?'),
          actions: [
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              child: const Text('Eliminar'),
              onPressed: () {
                usuarioProvider.eliminarUsuario(usuario.id); // ✅ Se asegura que `id` no sea nulo
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
