import 'package:dartz/dartz.dart';

import 'package:dclinic/data/datasource/getdata-remote-datasource.dart';
import 'package:dclinic/domain/entites/patient.dart';
import 'package:dclinic/domain/repositories/get-data-repo.dart';

import '../../Config/error/exception.dart' as s;
import '../../config/error/Failure.dart' ;
import '../../config/error/enumerror.dart';
import '../../config/error/exception.dart';
import '../model/patientModel.dart';

class GetDataRepoImpl extends GetDataRpo {
  final GetDataRemoteDataSource authRemoteDataSource;

  GetDataRepoImpl({
    required this.authRemoteDataSource,
  }) : super();

  @override
  Future<Either<Failure, PatientModel>> getData() async {
    try {
      final result = await authRemoteDataSource.getData();
      return Right(result);
    } catch (error) {
      return Left(ServerFailure(ErrorCode.SERVER_ERROR, error.toString()));
    }
  }
}
