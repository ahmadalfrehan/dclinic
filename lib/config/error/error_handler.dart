
import 'exception.dart';

class ErrorHandler {
  static bool handleRemoteError(int statusCode, String message) {
    if (statusCode >= 200 && statusCode < 300) {
      return true;
    } else if (statusCode == 401) {
      throw RemoteException(ErrorCode2.UNAUTHENTICATED, message);
    } else if (statusCode == 422) {
      throw RemoteException(ErrorCode2.WRONG_INPUT, message);
    } else if (statusCode == 403) {
      throw RemoteException(ErrorCode2.FORBIDDEN, message);
    } else if (statusCode == 404) {
      throw RemoteException(ErrorCode2.NOT_FOUND, message);
    } else if (statusCode >= 500) {
      throw RemoteException(ErrorCode2.SERVER_ERROR, message);
    }
    return false;
  }
}
