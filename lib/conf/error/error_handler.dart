import 'enumerror.dart';
import 'exception.dart';

class ErrorHandler {
  static bool handleRemoteError(int statusCode, String message) {
    if (statusCode >= 200 && statusCode < 300) {
      return true;
    } else if (statusCode == 401) {
      throw RemoteException(ErrorCode.UNAUTHENTICATED, message);
    } else if (statusCode == 422) {
      throw RemoteException(ErrorCode.WRONG_INPUT, message);
    } else if (statusCode == 403) {
      throw RemoteException(ErrorCode.FORBIDDEN, message);
    } else if (statusCode == 404) {
      throw RemoteException(ErrorCode.NOT_FOUND, message);
    } else if (statusCode >= 500) {
      throw RemoteException(ErrorCode.SERVER_ERROR, message);
    }
    return false;
  }
}
