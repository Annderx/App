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
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildTextField(_codigoUsuarioController, 'Código Usuario', Icons.vpn_key, enabled: false),
              _buildTextField(_nombreController, 'Nombre', Icons.person, isRequired: true),
              _buildTextField(_codigoEmpleadoController, 'Código Empleado', Icons.badge, isRequired: true),
              _buildTextField(_tipoUsuarioController, 'Tipo de Usuario', Icons.account_circle, isRequired: true),
              _buildTextField(_nombreUsuarioController, 'Nombre de Usuario', Icons.account_box, isRequired: true),
              _buildTextField(_contrasenaController, 'Contraseña', Icons.lock, isRequired: true, isPassword: true),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildButton(
                    icon: Icons.save,
                    label: 'Guardar',
                    color: Colors.green,
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
                        Provider.of<UsuarioProvider>(context, listen: false).agregarUsuario(usuario);
                        _limpiarCasillas();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Usuario registrado con éxito')),
                        );
                      }
                    },
                  ),
                  _buildButton(
                    icon: Icons.clear,
                    label: 'Limpiar',
                    color: Colors.red,
                    onPressed: _limpiarCasillas,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, IconData icon, {bool enabled = true, bool isRequired = false, bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        enabled: enabled,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          filled: true,
          fillColor: Colors.grey[200],
        ),
        validator: (value) {
          if (isRequired && (value == null || value.isEmpty)) {
            return 'Este campo es obligatorio';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildButton({required IconData icon, required String label, required Color color, required VoidCallback onPressed}) {
    return ElevatedButton.icon(
      icon: Icon(icon, size: 20),
      label: Text(label, style: const TextStyle(fontSize: 16)),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: onPressed,
    );
  }
}
