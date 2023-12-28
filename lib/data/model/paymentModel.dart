import '../../domain/entites/payment.dart';

class PaymentModel extends Payment {
  PaymentModel({
    required super.paymentId,
    required super.patientId,
    required super.amount,
    required super.date,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> data) {
    return PaymentModel(
      paymentId: data['paymentId'],
      patientId: data['patientId'],
      amount: data['amount'],
      date: data['date'],
    );
  }
}
