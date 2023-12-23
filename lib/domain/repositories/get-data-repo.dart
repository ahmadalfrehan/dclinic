import 'package:dartz/dartz.dart';

import '../../config/error/Failure.dart';
import '../entites/patient.dart';

abstract class GetDataRpo {
  Future<Either<Failure, Patient>> getData();
}
