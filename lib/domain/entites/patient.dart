import 'package:dclinic/domain/entites/treatment.dart';
import 'package:equatable/equatable.dart';

class Patient extends Equatable {
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

  @override
  // TODO: implement props
  List<Object?> get props => [
        name,
        phone,
        address,
        patientId,
        treatment,
      ];
}
