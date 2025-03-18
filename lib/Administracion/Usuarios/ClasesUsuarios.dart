class Usuario {
  final int? id;
  final String codigoUsuario;
  final String nombre;
  final String codigoEmpleado;
  final String tipoUsuario;
  final String nombreUsuario;
  final String _contrasena; // Privado para mayor seguridad

  Usuario({
    this.id,
    required this.codigoUsuario,
    required this.nombre,
    required this.codigoEmpleado,
    required this.tipoUsuario,
    required this.nombreUsuario,
    required String contrasena, // Se usa un setter seguro
  }) : _contrasena = _encriptarContrasena(contrasena); // Encripta la contraseña

  /// Método para encriptar contraseñas (simple simulación)
  static String _encriptarContrasena(String contrasena) {
    return contrasena.split('').reversed.join(); // Simulación, usar un hash real
  }

  /// Método para verificar contraseña (para login)
  bool verificarContrasena(String input) {
    return _encriptarContrasena(input) == _contrasena;
  }

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      id: json['id'],
      codigoUsuario: json['codigoUsuario'],
      nombre: json['nombre'],
      codigoEmpleado: json['codigoEmpleado'],
      tipoUsuario: json['tipoUsuario'],
      nombreUsuario: json['nombreUsuario'],
      contrasena: json['contrasena'], // Encriptada al crearse
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'codigoUsuario': codigoUsuario,
      'nombre': nombre,
      'codigoEmpleado': codigoEmpleado,
      'tipoUsuario': tipoUsuario,
      'nombreUsuario': nombreUsuario,
      'contrasena': '********', // No exponer la contraseña real
    };
  }
}
