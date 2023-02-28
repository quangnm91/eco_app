enum RemoteMethod { get, post, put, delete }

abstract class IRemoteInput {
  String endPoint;
  dynamic body;
  RemoteMethod method;

  Map<String, String> header;
  Map<String, dynamic>? queryParameters;

  IRemoteInput(
      {required this.endPoint,
      required this.method,
      required this.header,
      required this.body,
      this.queryParameters});

  @override
  String toString() {
    return '$runtimeType: {endPoint: $endPoint, method: $method, header: $header,'
        ' body: $body, queryParameters: $queryParameters}';
  }
}

class RemoteInput extends IRemoteInput {
  RemoteInput(
      {required String endPoint,
      required RemoteMethod method,
      required Map<String, String> header,
      dynamic body,
      Map<String, dynamic>? queryParameters})
      : super(
            endPoint: endPoint,
            method: method,
            header: header,
            body: body,
            queryParameters: queryParameters);
}
