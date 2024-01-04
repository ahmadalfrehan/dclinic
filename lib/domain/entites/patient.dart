import 'package:dclinic/domain/entites/familyGroup.dart';
import 'package:dclinic/domain/entites/payment.dart';
import 'package:dclinic/domain/entites/treatment-option.dart';
import 'package:dclinic/domain/entites/treatment.dart';
import 'package:equatable/equatable.dart';

class Patient extends Equatable {
  String? name;
  String? phone;
  String? address;
  int? patientId;
  List<Treatment> treatment = [];
  List<FamilyGroup> familyGroup = [];
  List<Payment> payments = [];
  List<TreatmentOption> treatmentOptions = [];

  Patient({
    required this.name,
    required this.phone,
    required this.address,
    required this.patientId,
    required this.treatment,
    required this.treatmentOptions,
    required this.familyGroup,
    required this.payments,
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
