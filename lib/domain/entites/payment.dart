abstract class Payment {
  int? paymentId;
  int? patientId;
  double? amount;
  String? date;

  Payment({
    required this.paymentId,
    required this.patientId,
    required this.amount,
    required this.date,
  });
}
