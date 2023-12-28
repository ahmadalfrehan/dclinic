abstract class Treatment {
  int? treatmentID;
  int? patientID;
  String? governorate;
  String? restoration;
  String? gumTreatment;
  String? takeOff;
  String? reProcessing;
  String? dow;
  double? price;
  int? toothNumber;
  String? date;

  Treatment({
    required this.treatmentID,
    required this.patientID,
    required this.governorate,
    required this.restoration,
    required this.gumTreatment,
    required this.takeOff,
    required this.reProcessing,
    required this.dow,
    required this.price,
    required this.toothNumber,
    required this.date,
  });
}
