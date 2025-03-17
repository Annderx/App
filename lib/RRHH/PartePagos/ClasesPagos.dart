class PartePago {
  final DateTime fecha;
  final String colaborador;
  final String montoAcuenta1;
  final String fechaPagoAcuenta1;
  final String formaPagoAcuenta1;
  final String observacionAcuenta1;
  final String? montoAcuenta2;
  final String? fechaPagoAcuenta2;
  final String? formaPagoAcuenta2;
  final String? observacionAcuenta2;
  final String? montoAcuenta3;
  final String? fechaPagoAcuenta3;
  final String? formaPagoAcuenta3;
  final String? observacionAcuenta3;
  final String? montoAcuenta4;
  final String? fechaPagoAcuenta4;
  final String? formaPagoAcuenta4;
  final String? observacionAcuenta4;
  final String? montoAcuenta5;
  final String? fechaPagoAcuenta5;
  final String? formaPagoAcuenta5;
  final String? observacionAcuenta5;
  final String? montoAcuenta6;
  final String? fechaPagoAcuenta6;
  final String? formaPagoAcuenta6;
  final String? observacionAcuenta6;
  final String? montoAcuenta7;
  final String? fechaPagoAcuenta7;
  final String? formaPagoAcuenta7;
  final String? observacionAcuenta7;
  final String? montoAcuenta8;
  final String? fechaPagoAcuenta8;
  final String? formaPagoAcuenta8;
  final String? observacionAcuenta8;
  final String? montoAcuenta9;
  final String? fechaPagoAcuenta9;
  final String? formaPagoAcuenta9;
  final String? observacionAcuenta9;
  final String? montoAcuenta10;
  final String? fechaPagoAcuenta10;
  final String? formaPagoAcuenta10;
  final String? observacionAcuenta10;
  final String saldoPagar;

  PartePago({
    required this.fecha,
    required this.colaborador,
    required this.montoAcuenta1,
    required this.fechaPagoAcuenta1,
    required this.formaPagoAcuenta1,
    required this.observacionAcuenta1,
    this.montoAcuenta2,
    this.fechaPagoAcuenta2,
    this.formaPagoAcuenta2,
    this.observacionAcuenta2,
    this.montoAcuenta3,
    this.fechaPagoAcuenta3,
    this.formaPagoAcuenta3,
    this.observacionAcuenta3,
    this.montoAcuenta4,
    this.fechaPagoAcuenta4,
    this.formaPagoAcuenta4,
    this.observacionAcuenta4,
    this.montoAcuenta5,
    this.fechaPagoAcuenta5,
    this.formaPagoAcuenta5,
    this.observacionAcuenta5,
    this.montoAcuenta6,
    this.fechaPagoAcuenta6,
    this.formaPagoAcuenta6,
    this.observacionAcuenta6,
    this.montoAcuenta7,
    this.fechaPagoAcuenta7,
    this.formaPagoAcuenta7,
    this.observacionAcuenta7,
    this.montoAcuenta8,
    this.fechaPagoAcuenta8,
    this.formaPagoAcuenta8,
    this.observacionAcuenta8,
    this.montoAcuenta9,
    this.fechaPagoAcuenta9,
    this.formaPagoAcuenta9,
    this.observacionAcuenta9,
    this.montoAcuenta10,
    this.fechaPagoAcuenta10,
    this.formaPagoAcuenta10,
    this.observacionAcuenta10,
    required this.saldoPagar,
  });

  // Métodos toJson() y fromJson() para serialización/deserialización
  Map<String, dynamic> toJson() {
    return {
      'fecha': fecha.toIso8601String(),
      'colaborador': colaborador,
      'montoAcuenta1': montoAcuenta1,
      'fechaPagoAcuenta1': fechaPagoAcuenta1,
      'formaPagoAcuenta1': formaPagoAcuenta1,
      'observacionAcuenta1': observacionAcuenta1,
      'montoAcuenta2': montoAcuenta2,
      'fechaPagoAcuenta2': fechaPagoAcuenta2,
      'formaPagoAcuenta2': formaPagoAcuenta2,
      'observacionAcuenta2': observacionAcuenta2,
      'montoAcuenta3': montoAcuenta3,
      'fechaPagoAcuenta3': fechaPagoAcuenta3,
      'formaPagoAcuenta3': formaPagoAcuenta3,
      'observacionAcuenta3': observacionAcuenta3,
      'montoAcuenta4': montoAcuenta4,
      'fechaPagoAcuenta4': fechaPagoAcuenta4,
      'formaPagoAcuenta4': formaPagoAcuenta4,
      'observacionAcuenta4': observacionAcuenta4,
      'montoAcuenta5': montoAcuenta5,
      'fechaPagoAcuenta5': fechaPagoAcuenta5,
      'formaPagoAcuenta5': formaPagoAcuenta5,
      'observacionAcuenta5': observacionAcuenta5,
      'montoAcuenta6': montoAcuenta6,
      'fechaPagoAcuenta6': fechaPagoAcuenta6,
      'formaPagoAcuenta6': formaPagoAcuenta6,
      'observacionAcuenta6': observacionAcuenta6,
      'montoAcuenta7': montoAcuenta7,
      'fechaPagoAcuenta7': fechaPagoAcuenta7,
      'formaPagoAcuenta7': formaPagoAcuenta7,
      'observacionAcuenta7': observacionAcuenta7,
      'montoAcuenta8': montoAcuenta8,
      'fechaPagoAcuenta8': fechaPagoAcuenta8,
      'formaPagoAcuenta8': formaPagoAcuenta8,
      'observacionAcuenta8': observacionAcuenta8,
      'montoAcuenta9': montoAcuenta9,
      'fechaPagoAcuenta9': fechaPagoAcuenta9,
      'formaPagoAcuenta9': formaPagoAcuenta9,
      'observacionAcuenta9': observacionAcuenta9,
      'montoAcuenta10': montoAcuenta10,
      'fechaPagoAcuenta10': fechaPagoAcuenta10,
      'formaPagoAcuenta10': formaPagoAcuenta10,
      'observacionAcuenta10': observacionAcuenta10,
      'saldoPagar': saldoPagar,
    };
  }

  factory PartePago.fromJson(Map<String, dynamic> json) {
    return PartePago(
      fecha: DateTime.parse(json['fecha']),
      colaborador: json['colaborador'],
      montoAcuenta1: json['montoAcuenta1'],
      fechaPagoAcuenta1: json['fechaPagoAcuenta1'],
      formaPagoAcuenta1: json['formaPagoAcuenta1'],
      observacionAcuenta1: json['observacionAcuenta1'],
      montoAcuenta2: json['montoAcuenta2'],
      fechaPagoAcuenta2: json['fechaPagoAcuenta2'],
      formaPagoAcuenta2: json['formaPagoAcuenta2'],
      observacionAcuenta2: json['observacionAcuenta2'],
      montoAcuenta3: json['montoAcuenta3'],
      fechaPagoAcuenta3: json['fechaPagoAcuenta3'],
      formaPagoAcuenta3: json['formaPagoAcuenta3'],
      observacionAcuenta3: json['observacionAcuenta3'],
      montoAcuenta4: json['montoAcuenta4'],
      fechaPagoAcuenta4: json['fechaPagoAcuenta4'],
      formaPagoAcuenta4: json['formaPagoAcuenta4'],
      observacionAcuenta4: json['observacionAcuenta4'],
      montoAcuenta5: json['montoAcuenta5'],
      fechaPagoAcuenta5: json['fechaPagoAcuenta5'],
      formaPagoAcuenta5: json['formaPagoAcuenta5'],
      observacionAcuenta5: json['observacionAcuenta5'],
      montoAcuenta6: json['montoAcuenta6'],
      fechaPagoAcuenta6: json['fechaPagoAcuenta6'], montoAcuenta7: json['montoAcuenta7'],
      fechaPagoAcuenta7: json['fechaPagoAcuenta7'],
      formaPagoAcuenta7: json['formaPagoAcuenta7'],
      observacionAcuenta7: json['observacionAcuenta7'],
      montoAcuenta8: json['montoAcuenta8'],
      fechaPagoAcuenta8: json['fechaPagoAcuenta8'],
      formaPagoAcuenta8: json['formaPagoAcuenta8'],
      observacionAcuenta8: json['observacionAcuenta8'],
      montoAcuenta9: json['montoAcuenta9'],
      fechaPagoAcuenta9: json['fechaPagoAcuenta9'],
      formaPagoAcuenta9: json['formaPagoAcuenta9'],
      observacionAcuenta9: json['observacionAcuenta9'],
      montoAcuenta10: json['montoAcuenta10'],
      fechaPagoAcuenta10: json['fechaPagoAcuenta10'],
      formaPagoAcuenta10: json['formaPagoAcuenta10'],
      observacionAcuenta10: json['observacionAcuenta10'],
      saldoPagar: json['saldoPagar'],
    );
  }
}