

import 'exception.dart';

abstract class Failure {}

class CacheError extends Failure {
  final ErrorCode2 errorCode;
  final String message;
  CacheError(this.errorCode, this.message);
}

class ServerFailure implements Failure {
  final ErrorCode2 errorCode;
  final String message;

  ServerFailure(this.errorCode, this.message);
}