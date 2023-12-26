import 'package:dartz/dartz.dart';

import '../../config/error/Failure.dart';
import '../../data/model/patientModel.dart';
import '../entites/patient.dart';

abstract class GetDataRpo {
  Future<Either<Failure, PatientModel>> getData();
}
