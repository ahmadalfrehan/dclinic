import 'Failure.dart';

class RemoteException extends Failure implements Exception {
  final ErrorCode2 errorCode;
  final String message;
  RemoteException(this.errorCode, this.message);
}
enum ErrorCode2 {
  SERVER_ERROR,
  UNAUTHENTICATED,
  TIMEOUT,
  NO_INTERNET_CONNECTION,
  WRONG_INPUT,
  PARSE_ERROR,
  FORBIDDEN,
  NOT_VERIFIED,
  REGISTERED_EMAIL,
  NOT_FOUND,
  IDENTIFIER_TAKEN
}