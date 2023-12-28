import 'package:dartz/dartz.dart';

import '../../Conf/core/domain/use_case/use_case.dart';
import '../../Conf/error/Failure.dart' as f;
import '../entites/patient.dart';
import '../repositories/get-data-repo.dart';

class GetHomeDataUseCase extends UseCase<List<Patient>, String> {
  final GetDataRpo getDataRepo;

  GetHomeDataUseCase({required this.getDataRepo});

  @override
  Future<Either<f.Failure, List<Patient>>> call(params) async {
    return await getDataRepo.getData();
  }
}
