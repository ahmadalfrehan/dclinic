import 'package:dclinic/domain/entites/treatment.dart';

abstract class Patient {
  String? name;
  String? phone;
  String? address;
  int? patientId;
  List<Treatment> treatment = [];

  Patient({
    required this.name,
    required this.phone,
    required this.address,
    required this.patientId,
    required this.treatment,
  });
}
