import 'package:dclinic/data/model/patientModel.dart';
import 'package:dclinic/data/model/paymentModel.dart';
import 'package:dclinic/data/model/treatmentModel.dart';
import 'package:dclinic/domain/entites/familyGroup.dart';
import 'package:dclinic/domain/entites/payment.dart';
import 'package:dclinic/domain/entites/treatment-option.dart';
import 'package:dclinic/domain/entites/treatment.dart';

import '../../domain/entites/patient.dart';
import 'familyGroupModel.dart';

class ReturnedModel {
  List<Patient> patients = [];
  List<FamilyGroup> familyGroup = [];
  List<Treatment> treatment = [];
  List<Payment> payments = [];

  List<TreatmentOption> treatmentOptions = [];

  ReturnedModel({
    required this.patients,
    required this.familyGroup,
    required this.treatment,
    required this.payments,
    required this.treatmentOptions,
  });

  factory ReturnedModel.fromJson(Map<String, dynamic> data) {
    return ReturnedModel(
      patients: data['patients'] == null
          ? []
          : List.from(data['patients'].map((e) => PatientModel.fromJson(e))),
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
