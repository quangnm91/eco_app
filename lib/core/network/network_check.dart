import 'package:data_connection_checker/data_connection_checker.dart';

mixin NetworkCheck {
  static final DataConnectionChecker connectionChecker =
      DataConnectionChecker();
  Future<bool> hasConnection() {
    return connectionChecker.hasConnection;
  }
}
