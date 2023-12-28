abstract class TreatmentOption {
  int? patientId;
  int? optionId;

  double? price;
  String? treatmentType;
  String? optionName;

  TreatmentOption({
    required this.patientId,
    required this.optionId,
    required this.price,
    required this.treatmentType,
    required this.optionName,
  });
}
