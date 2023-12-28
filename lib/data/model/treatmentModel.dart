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
      treatmentID: data['treatmentID'],
      patientID: data['patientID'],
      governorate: data['governorate'],
      restoration: data['restoration'],
      gumTreatment: data['gumTreatment'],
      takeOff: data['takeOff'],
      reProcessing: data['reProcessing'],
      dow: data['dow'],
      price: data['price'],
      toothNumber: data['toothNumber'],
      date: data['date'],
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
      optionId: data['optionId'],
      price: data['price'],
      treatmentType: data['treatmentType'],
      optionName: data['optionName'],
    );
  }
}

