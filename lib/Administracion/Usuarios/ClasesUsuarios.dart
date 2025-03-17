class Usuario {
  final int id;
  final String codigoUsuario;
  final String nombre;
  final String codigoEmpleado;
  final String tipoUsuario;
  final String nombreUsuario;
  final String contrasena;

  Usuario({
    required this.id,
    required this.codigoUsuario,
    required this.nombre,
    required this.codigoEmpleado,
    required this.tipoUsuario,
    required this.nombreUsuario,
    required this.contrasena,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      id: json['id'],
      codigoUsuario: json['codigoUsuario'],
      nombre: json['nombre'],
      codigoEmpleado: json['codigoEmpleado'],
      tipoUsuario: json['tipoUsuario'],
      nombreUsuario: json['nombreUsuario'],
      contrasena: json['contrasena'],
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
      'contrasena': contrasena,
    };
  }
}