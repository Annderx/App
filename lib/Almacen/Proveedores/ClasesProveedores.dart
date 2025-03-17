class Proveedor {
  final int codigoProveedor;
  final String razonSocial;
  final String noIdentificacion;
  final String direccion;
  final String metodoPago;
  final String categoria;
  final String telefono;
  final String credito;
  final String correo;
  final String notas;
  final String contacto1Nombre;
  final String contacto1Correo;
  final String contacto1Celular;
  final String contacto2Nombre;
  final String contacto2Correo;
  final String contacto2Celular;

  Proveedor({
    required this.codigoProveedor,
    required this.razonSocial,
    required this.noIdentificacion,
    required this.direccion,
    required this.metodoPago,
    required this.categoria,
    required this.telefono,
    required this.credito,
    required this.correo,
    required this.notas,
    required this.contacto1Nombre,
    required this.contacto1Correo,
    required this.contacto1Celular,
    required this.contacto2Nombre,
    required this.contacto2Correo,
    required this.contacto2Celular,
  });

  Map<String, dynamic> toJson() {
    return {
      'codigoProveedor': codigoProveedor,
      'razonSocial': razonSocial,
      'noIdentificacion': noIdentificacion,
      'direccion': direccion,
      'metodoPago': metodoPago,
      'categoria': categoria,
      'telefono': telefono,
      'credito': credito,
      'correo': correo,
      'notas': notas,
      'contacto1Nombre': contacto1Nombre,
      'contacto1Correo': contacto1Correo,
      'contacto1Celular': contacto1Celular,
      'contacto2Nombre': contacto2Nombre,
      'contacto2Correo': contacto2Correo,
      'contacto2Celular': contacto2Celular,
    };
  }

  factory Proveedor.fromJson(Map<String, dynamic> json) {
    return Proveedor(
      codigoProveedor: json['codigoProveedor'],
      razonSocial: json['razonSocial'],
      noIdentificacion: json['noIdentificacion'],
      direccion: json['direccion'],
      metodoPago: json['metodoPago'],
      categoria: json['categoria'],
      telefono: json['telefono'],
      credito: json['credito'],
      correo: json['correo'],
      notas: json['notas'],
      contacto1Nombre: json['contacto1Nombre'],
      contacto1Correo: json['contacto1Correo'],
      contacto1Celular: json['contacto1Celular'],
      contacto2Nombre: json['contacto2Nombre'],
      contacto2Correo: json['contacto2Correo'],
      contacto2Celular: json['contacto2Celular'],
    );
  }
}