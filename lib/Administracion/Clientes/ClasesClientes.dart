class Cliente {
  final int? id;
  final String codigo;
  final String razonSocial;
  final String direccion;
  final String? tipoCliente;
  final bool esRuc;
  final String? ruc;
  final String? dni;
  final String? tipoContacto;
  final String? contacto;
  final String? telefono;
  final String? celular;
  final String? correo;

  Cliente({
    this.id,
    required this.codigo,
    required this.razonSocial,
    required this.direccion,
    this.tipoCliente,
    required this.esRuc,
    this.ruc,
    this.dni,
    this.tipoContacto,
    this.contacto,
    this.telefono,
    this.celular,
    this.correo,
  });
    Map<String, dynamic> toMap() {
      
    return {
      'codigo': codigo,
      'razonSocial': razonSocial,
      'direccion': direccion,
      'tipoCliente': tipoCliente,
      'esRuc': esRuc ? 1 : 0,
      'ruc': ruc,
      'dni': dni,
      'tipoContacto': tipoContacto,
      'contacto': contacto,
      'telefono': telefono,
      'celular': celular,
      'correo': correo,
       'id': id,
    };
  }
}