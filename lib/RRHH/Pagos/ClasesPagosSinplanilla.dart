class PagoSinPlanilla {
  final DateTime fecha;
  final String colaborador;
  final int diasMes;
  final int diasLaborados;
  final int diasFaltados;
  final double sueldoBaseInicial;
  final double descuentoFaltas;
  final double sueldoBase;
  final double bonoExtraordinario;
  final double adelanto;
  final double otrosDescuentos;
  final double sueldoNeto;

  PagoSinPlanilla({
    required this.fecha,
    required this.colaborador,
    required this.diasMes,
    required this.diasLaborados,
    required this.diasFaltados,
    required this.sueldoBaseInicial,
    required this.descuentoFaltas,
    required this.sueldoBase,
    required this.bonoExtraordinario,
    required this.adelanto,
    required this.otrosDescuentos,
    required this.sueldoNeto,
  });

  // Implementa toJson y fromJson si necesitas serialización/deserialización
}