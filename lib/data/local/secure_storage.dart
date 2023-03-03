import 'package:eco_app/domain/model/token_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class SecureStorage {
  Future<String?> getSavedToken();
  Future<TokenModel> updateToken({required TokenModel token});
  Future<void> removeToken();
}

const TOKEN_KEY = "TOKEN";

class SecureStorageImpl extends SecureStorage {
  final storage = const FlutterSecureStorage();

  @override
  Future<String?> getSavedToken() async {
    String? token = await storage.read(key: TOKEN_KEY);
    return token;
  }

  @override
  Future<TokenModel> updateToken({required TokenModel token}) async {
    await storage.write(key: TOKEN_KEY, value: token.toJson());
    return token;
  }

  @override
  Future<void> removeToken() async {
    await storage.delete(key: TOKEN_KEY);
  }
}
