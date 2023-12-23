import 'package:dartz/dartz.dart';

import '../../Config/core/domain/use_case/use_case.dart';
import '../../Config/error/Failure.dart';
import '../entites/patient.dart';
import '../repositories/get-data-repo.dart';

class GetHomeDataUseCase extends UseCase<Patient, Failure> {
  final GetDataRpo getDataRepo;

  GetHomeDataUseCase({required this.getDataRepo});

  @override
  Future<Either<Failure, Patient>> call(params) async {
    return await getDataRepo.getData();
  }
}
