// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class Failure {
  String? message;
  String? title;
  Failure({
    this.message,
    this.title,
  });
}

class RemoteFailure extends Failure {
  dynamic data;
  RemoteFailure({String? message, this.data, String? title})
      : super(message: message, title: title);
}

class LocalDataFailure extends Failure {
  LocalDataFailure({String? message, String? title})
      : super(message: message, title: title);
}

class UnknownFailure extends Failure {
  UnknownFailure({String? message, String? title})
      : super(message: message, title: title);
}
