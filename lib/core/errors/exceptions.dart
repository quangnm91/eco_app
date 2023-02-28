// ignore_for_file: public_member_api_docs, sort_constructors_first
class RemoteException implements Exception {
  String errorCode;
  String errorMessage;
  int httpStatus;

  RemoteException(
      {required this.errorCode,
      required this.errorMessage,
      required this.httpStatus});
}

class LocalDataException implements Exception {
  String errorMessage;
  LocalDataException({
    required this.errorMessage,
  });
}

const SOCKET_EXCEPTION = "SOCKET_EXCEPTION";
const TIMEOUT_EXCEPTION = "TIMEOUT_EXCEPTION";
const UNKNOWN_EXCEPTION = "UNKNOWN_EXCEPTION";
const INTERNAL_SERVER_ERROR = "INTERNAL_SERVER_ERROR";

const SOCKET_EXCEPTION_MESSAGE = "Không thể kết nối đến server.";
const TIMEOUT_EXCEPTION_MESSAGE = "Lỗi hết thời gian chờ";
const INTERNAL_SERVER_ERROR_MESSAGE = "Lỗi máy chủ";
const UNKNOWN_EXCEPTION_MESSAGE = "Lỗi không xác định";
