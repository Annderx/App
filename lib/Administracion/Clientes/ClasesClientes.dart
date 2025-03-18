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

  const Cliente({
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
  }) : assert(!esRuc || ruc != null, 'Si es RUC, el campo RUC no puede ser nulo');

  /// Convierte el objeto Cliente a un mapa (para SQLite).
  Map<String, dynamic> toMap() {
    return {
      'id': id,
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
    };
  }

  /// Crea un objeto Cliente desde un mapa (al leer desde SQLite).
  factory Cliente.fromMap(Map<String, dynamic> map) {
    return Cliente(
      id: map['id'],
      codigo: map['codigo'],
      razonSocial: map['razonSocial'],
      direccion: map['direccion'],
      tipoCliente: map['tipoCliente'],
      esRuc: map['esRuc'] == 1,
      ruc: map['ruc'],
      dni: map['dni'],
      tipoContacto: map['tipoContacto'],
      contacto: map['contacto'],
      telefono: map['telefono'],
      celular: map['celular'],
      correo: map['correo'],
    );
  }

  /// Crea una copia del objeto con cambios específicos.
  Cliente copyWith({
    int? id,
    String? codigo,
    String? razonSocial,
    String? direccion,
    String? tipoCliente,
    bool? esRuc,
    String? ruc,
    String? dni,
    String? tipoContacto,
    String? contacto,
    String? telefono,
    String? celular,
    String? correo,
  }) {
    return Cliente(
      id: id ?? this.id,
      codigo: codigo ?? this.codigo,
      razonSocial: razonSocial ?? this.razonSocial,
      direccion: direccion ?? this.direccion,
      tipoCliente: tipoCliente ?? this.tipoCliente,
      esRuc: esRuc ?? this.esRuc,
      ruc: ruc ?? this.ruc,
      dni: dni ?? this.dni,
      tipoContacto: tipoContacto ?? this.tipoContacto,
      contacto: contacto ?? this.contacto,
      telefono: telefono ?? this.telefono,
      celular: celular ?? this.celular,
      correo: correo ?? this.correo,
    );
  }
}
