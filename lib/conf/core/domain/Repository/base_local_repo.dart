import 'package:dartz/dartz.dart';

import '../../../error/Failure.dart';

abstract class BaseLocalRepo {
  Future<Either<Failure, String>> getToken();

  Future<Either<Failure, bool>> getRememberMe();

  Future<Either<Failure, void>> logOutUser();
}
