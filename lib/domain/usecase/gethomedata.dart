import 'package:dartz/dartz.dart';

import '../../Config/core/domain/use_case/use_case.dart';
import '../../Config/error/Failure.dart';
import '../entites/patient.dart';
import '../repositories/get-data-repo.dart';

class GetHomeDataUseCase extends UseCase<Failure, Patient> {
  final GetDataRpo getDataRpo;

  GetHomeDataUseCase({required this.getDataRpo});

  @override
  Future<Either<Failure, Patient>> call(params) async {
    return await getDataRpo.getData(); // Assuming getData returns Either<Failure, Patient>
  }
}
