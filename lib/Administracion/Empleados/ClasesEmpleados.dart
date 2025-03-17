class Empleado {
  final String codigo;
  final String nombre;
  final String area;
  final String tipo;
  final String funcion;
  final String condicion;
  final String telefono;
  final String dni;
  final String direccion;
  final String sueldo;
  final String edad;
  final DateTime? fechaNacimiento;

  Empleado({
    required this.codigo,
    required this.nombre,
    required this.area,
    required this.tipo,
    required this.funcion,
    required this.condicion,
    required this.telefono,
    required this.dni,
    required this.direccion,
    required this.sueldo,
    required this.edad,
    required this.fechaNacimiento,
  });
}