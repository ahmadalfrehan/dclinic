import 'package:dartz/dartz.dart';

import '../../../error/Failure.dart';
import '../../domain/Repository/base_local_repo.dart';
import '../datasource/base_local_datasource.dart';

class BaseLocalRepoImpl implements BaseLocalRepo {
  final BaseLocalDataSource baseLocalDataSource;

  BaseLocalRepoImpl({required this.baseLocalDataSource});

  @override
  Future<Either<Failure, String>> getToken() async {
    throw UnimplementedError();
    // final token = await baseLocalDataSource.getToken();
    // log(token);
    // if (token != null) {
    //   return Right(token);
    // } else {
    //   return Left(CacheError(ErrorCode.SERVER_ERROR, ''));
    // }
  }

  @override
  Future<Either<Failure, void>> logOutUser() {
    // TODO: implement logOutUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> getRememberMe() async {
    throw UnimplementedError();

  }
}
