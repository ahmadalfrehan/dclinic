import 'package:dclinic/data/model/familyGroupModel.dart';
import 'package:dclinic/data/model/paymentModel.dart';
import 'package:dclinic/data/model/treatmentModel.dart';
import 'package:dclinic/domain/entites/patient.dart';

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
      name: data['Name'],
      phone: data['PhoneNumber'],
      address: data['Address'],
      patientId: data['PatientID'],
      treatment: data['treatments'] == null
          ? []
          : List.from(
              data['treatments'].map((e) => TreatmentModel.fromJson(e))),
      familyGroup: data['familyGroup'] == null
          ? []
          : List.from(
              data['familyGroup'].map((e) => FamilyGroupModel.fromJson(e))),
      payments: data['payments'] == null
          ? []
          : List.from(data['payments'].map((e) => PaymentModel.fromJson(e))),
      treatmentOptions: data['treatmentOptions'] == null
          ? []
          : List.from(data['treatmentOptions']
              .map((e) => TreatmentOptionsModel.fromJson(e))),
    );
  }
}
