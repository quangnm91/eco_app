// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:eco_app/core/errors/exceptions.dart';
import 'package:eco_app/core/network/network_check.dart';

import 'package:eco_app/core/utils/log_helper.dart';
import 'package:eco_app/core/utils/remote_input.dart';

import '../../config/common.dart';

class RemoteConnection with NetworkCheck {
  RemoteConnection();
  Future<dynamic> execute(RemoteInput request) async {
    Future<Response> response;

    final isConnected = await hasConnection();
    if (!isConnected) {
      throw (Exception('Offline network'));
    }

    String? apiUrl = await Common.getAPIUrl();
    DioClient dioClient = DioClient(header: request.header, baseUrl: apiUrl!);
    switch (request.method) {
      case RemoteMethod.get:
        response = dioClient.http
            .get(request.endPoint, queryParameters: request.queryParameters);
        break;
      case RemoteMethod.post:
        response = dioClient.http.post(request.endPoint,
            data: request.body, queryParameters: request.queryParameters);
        break;
      case RemoteMethod.put:
        response = dioClient.http.put(request.endPoint,
            data: request.body, queryParameters: request.queryParameters);
        break;
      case RemoteMethod.delete:
        response = dioClient.http
            .delete(request.endPoint, queryParameters: request.queryParameters);
        break;
    }

    return response
        .then((response) => processResponse(response))
        .catchError((error) => handleError(error));
  }

  Future<dynamic> processResponse(Response response) async {
    if (response.statusCode == HttpStatus.ok ||
        response.statusCode == HttpStatus.created) {
      return response.data;
    }
    throw RemoteException(
        errorCode: UNKNOWN_EXCEPTION,
        errorMessage: response.data,
        httpStatus: response.statusCode!);
  }

  handleError(error) {
    if (error is DioError) {
      LogHelper().logger.e(error.message, error, error.stackTrace);
      switch (error.type) {
        case DioErrorType.connectionTimeout:
        case DioErrorType.sendTimeout:
        case DioErrorType.receiveTimeout:
          throw RemoteException(
              errorCode: TIMEOUT_EXCEPTION,
              errorMessage: error.message ?? TIMEOUT_EXCEPTION_MESSAGE,
              httpStatus: 404);
        case DioErrorType.badCertificate:
        case DioErrorType.badResponse:
          throw RemoteException(
              errorCode: INTERNAL_SERVER_ERROR,
              errorMessage: error.message ?? INTERNAL_SERVER_ERROR_MESSAGE,
              httpStatus: error.response?.statusCode ?? 400);
        case DioErrorType.cancel:
        case DioErrorType.connectionError:
          throw RemoteException(
              errorCode: SOCKET_EXCEPTION,
              errorMessage: error.message ?? SOCKET_EXCEPTION_MESSAGE,
              httpStatus: error.response?.statusCode ?? 500);
        case DioErrorType.unknown:
          throw RemoteException(
              errorCode: UNKNOWN_EXCEPTION,
              errorMessage: UNKNOWN_EXCEPTION_MESSAGE,
              httpStatus: 0);
      }
    }
    throw error;
  }
}

class DioClient {
  Map<String, dynamic> header;
  String baseUrl;
  late Dio dio;
  DioClient({
    required this.header,
    required this.baseUrl,
  }) {
    dio = Dio(BaseOptions(baseUrl: baseUrl, headers: header));
  }
  Dio get http => dio;
}
