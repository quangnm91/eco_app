import 'package:eco_app/domain/model/token_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class SecureStorage {
  Future<String?> getSavedToken();
  Future<Token> updateToken({required Token token});
  Future<void> removeToken();
}

const TOKEN_KEY = "TOKEN";

class SecureStorageImpl extends SecureStorage {
  final storage = const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true));

  @override
  Future<String?> getSavedToken() async {
    String? token = await storage.read(key: TOKEN_KEY);
    return token;
  }

  @override
  Future<Token> updateToken({required Token token}) async {
    await storage.write(key: TOKEN_KEY, value: token.toJson());
    return token;
  }

  @override
  Future<void> removeToken() async {
    await storage.delete(key: TOKEN_KEY);
  }
}