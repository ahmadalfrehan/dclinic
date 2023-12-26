import 'package:dclinic/domain/entites/patient.dart';

class PatientModel extends Patient {
  PatientModel({
    required super.name,
    required super.phone,
    required super.address,
    required super.patientId,
    required super.treatment,
  });
factory PatientModel.fromJson(Map<String, dynamic> data) {
    return PatientModel(
      name: data['name'],
      phone: data['phone'],
      address: data['address'],
      patientId: data['patientId'],
      treatment: data['treatment'],
    );
  }
}
