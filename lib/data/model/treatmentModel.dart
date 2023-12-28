import 'package:dclinic/domain/entites/payment.dart';
import 'package:dclinic/domain/entites/treatment-option.dart';
import 'package:dclinic/domain/entites/treatment.dart';

class TreatmentModel extends Treatment {
  TreatmentModel({
    required super.treatmentID,
    required super.patientID,
    required super.governorate,
    required super.restoration,
    required super.gumTreatment,
    required super.takeOff,
    required super.reProcessing,
    required super.dow,
    required super.price,
    required super.toothNumber,
    required super.date,
  });

  factory TreatmentModel.fromJson(Map<String, dynamic> data) {
    return TreatmentModel(
      treatmentID: data['TreatmentID'],
      patientID: data['PatientID'],
      governorate: data['Governorate'],
      restoration: data['Restoration'],
      gumTreatment: data['GumTreatment'],
      takeOff: data['TakeOff'],
      reProcessing: data['ReProcessing'],
      dow: data['Dow'],
      price: data['Price'],
      toothNumber: data['ToothNumber'],
      date: data['Date'],
    );
  }
}

class TreatmentOptionsModel extends TreatmentOption {
  TreatmentOptionsModel({
    required super.patientId,
    required super.optionId,
    required super.price,
    required super.treatmentType,
    required super.optionName,
  });

  factory TreatmentOptionsModel.fromJson(Map<String, dynamic> data) {
    return TreatmentOptionsModel(
      patientId: data['patientId'],
      optionId: data['OptionID'],
      price: data['Price'],
      treatmentType: data['TreatmentType'],
      optionName: data['OptionName'],
    );
  }
}

