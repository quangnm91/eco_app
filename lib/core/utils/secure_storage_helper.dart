import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageHelper {
  static final _storage = FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true));

  static setString(String key, String value) {
    return _storage.write(key: key, value: value);
  }

  static setInt(String key, int value) {
    return _storage.write(key: key, value: value.toString());
  }

  static setBool(String key, bool value) {
    return _storage.write(key: key, value: value.toString());
  }

  static Future<String?> readString(String key) async {
    return await _storage.read(key: key);
  }
}
