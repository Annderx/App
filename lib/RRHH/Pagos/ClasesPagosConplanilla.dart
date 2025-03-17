class PagoPlanilla {
  final DateTime fecha;
  final String colaborador;
  final int diasLaborados;
  final int diasFaltados;
  final double sueldoBaseInicial;
  final double pension;
  final double onp;
  final String tipoPension;
  final double descuentoFaltas;
  final double bonoExtraordinario;
  final String tiposAfp;
  final double tasas;
  final double primaSeguros;
  final double comision;
  final double sueldoBase;
  final double adelanto;
  final double horasExtras;
  final double otrosDescuentos;
  final double bonoOrdinario;
  final double sueldoNeto;
  final double sumEjecutable;

  PagoPlanilla({
    required this.fecha,
    required this.colaborador,
    required this.diasLaborados,
    required this.diasFaltados,
    required this.sueldoBaseInicial,
    required this.pension,
    required this.onp,
    required this.tipoPension,
    required this.descuentoFaltas,
    required this.bonoExtraordinario,
    required this.tiposAfp,
    required this.tasas,
    required this.primaSeguros,
    required this.comision,
    required this.sueldoBase,
    required this.adelanto,
    required this.horasExtras,
    required this.otrosDescuentos,
    required this.bonoOrdinario,
    required this.sueldoNeto,
    required this.sumEjecutable,
  });

  // Implementa toJson y fromJson si necesitas serialización/deserialización
}