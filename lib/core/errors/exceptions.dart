class RemoteException implements Exception {
  String errorCode;
  String errorMessage;
  int httpStatus;

  RemoteException(
      {required this.errorCode,
      required this.errorMessage,
      required this.httpStatus});
}

const socketException = "SOCKET_EXCEPTION";
const timeoutExpcetion = "TIMEOUT_EXCEPTION";
const unknownException = "UNKNOWN_EXCEPTION";
const internalServerError = "INTERNAL_SERVER_ERROR";
