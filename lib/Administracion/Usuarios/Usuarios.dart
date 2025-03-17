import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ClasesUsuarios.dart';
import 'usuarios_provider.dart';

class RegistroUsuarios extends StatefulWidget {
  const RegistroUsuarios({super.key});

  @override
  State<RegistroUsuarios> createState() => _RegistroUsuariosState();
}

class _RegistroUsuariosState extends State<RegistroUsuarios> {
  final _formKey = GlobalKey<FormState>();
  final _codigoUsuarioController = TextEditingController();
  final _nombreController = TextEditingController();
  final _codigoEmpleadoController = TextEditingController();
  final _tipoUsuarioController = TextEditingController();
  final _nombreUsuarioController = TextEditingController();
  final _contrasenaController = TextEditingController();

  void _limpiarCasillas() {
    _codigoUsuarioController.clear();
    _nombreController.clear();
    _codigoEmpleadoController.clear();
    _tipoUsuarioController.clear();
    _nombreUsuarioController.clear();
    _contrasenaController.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Usuarios'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _codigoUsuarioController,
                decoration: const InputDecoration(
                  labelText: 'Código Usuario',
                  icon: Icon(Icons.vpn_key),
                ),
                enabled: false,
              ),
              TextFormField(
                controller: _nombreController,
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                  icon: Icon(Icons.person),
                ),
              ),
              TextFormField(
                controller: _codigoEmpleadoController,
                decoration: const InputDecoration(
                  labelText: 'Código Empleado',
                  icon: Icon(Icons.badge),
                ),
              ),
              TextFormField(
                controller: _tipoUsuarioController,
                decoration: const InputDecoration(
                  labelText: 'Tipo de Usuario',
                  icon: Icon(Icons.account_circle),
                ),
              ),
              TextFormField(
                controller: _nombreUsuarioController,
                decoration: const InputDecoration(
                  labelText: 'Nombre de Usuario',
                  icon: Icon(Icons.account_box),
                ),
              ),
              TextFormField(
                controller: _contrasenaController,
                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                  icon: Icon(Icons.lock),
                ),
                obscureText: true,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final usuario = Usuario(
                          id: DateTime.now().millisecondsSinceEpoch,
                          codigoUsuario: _codigoUsuarioController.text,
                          nombre: _nombreController.text,
                          codigoEmpleado: _codigoEmpleadoController.text,
                          tipoUsuario: _tipoUsuarioController.text,
                          nombreUsuario: _nombreUsuarioController.text,
                          contrasena: _contrasenaController.text,
                        );
                        Provider.of<UsuarioProvider>(context, listen: false)
                            .agregarUsuario(usuario);
                        _limpiarCasillas();
                      }
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.save),
                        const SizedBox(width: 8),
                        const Text('Guardar'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _limpiarCasillas,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.clear),
                        const SizedBox(width: 8),
                        const Text('Limpiar'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}