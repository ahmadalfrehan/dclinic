import 'package:dartz/dartz.dart';
import 'package:dclinic/data/datasource/getdata-remote-datasource.dart';
import 'package:dclinic/domain/entites/patient.dart';
import 'package:dclinic/domain/repositories/get-data-repo.dart';

import '../../Conf/error/Failure.dart' ;
import '../../Conf/error/enumerror.dart';

class GetDataRepoImpl extends GetDataRpo {
  final GetDataRemoteDataSource authRemoteDataSource;

  GetDataRepoImpl({
    required this.authRemoteDataSource,
  }) : super();

  @override
  Future<Either<Failure, List<Patient>>> getData() async {
    // try {
      final result = await authRemoteDataSource.getData();
      return Right(result);
    // } catch (error) {
    //   return Left(ServerFailure(ErrorCode.SERVER_ERROR, error.toString()));
    // }
  }
}
