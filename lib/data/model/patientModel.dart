import 'package:dclinic/domain/entites/patient.dart';
import 'package:dclinic/domain/entites/treatment.dart';

class PatientModel extends Patient {
  PatientModel({
    required super.name,
    required super.phone,
    required super.address,
    required super.patientId,
    required super.treatment,
    required super.payments,
    required super.familyGroup,
    required super.treatmentOptions,
  });
factory PatientModel.fromJson(Map<String, dynamic> data) {
    return PatientModel(
      name: data['name'],
      phone: data['phone'],
      address: data['address'],
      patientId: data['patientId'],
      treatment:data[''],
      familyGroup: data[''],
      payments: data[''],
      treatmentOptions: data[''],
    );
  }
}
