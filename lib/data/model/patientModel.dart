import 'package:dclinic/domain/entites/patient.dart';

class PatientModel extends Patient {
  PatientModel({
    required super.name,
    required super.phone,
    required super.address,
    required super.patientId,
    required super.treatment,
  });
}
