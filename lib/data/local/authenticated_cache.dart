// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:eco_app/core/errors/exceptions.dart';
import 'package:eco_app/domain/model/token_model.dart';
import 'dart:developer' as developer;

import 'local_storage.dart';
import 'secure_storage.dart';

abstract class AuthenticatedCache {
  Future<TokenModel?> getToken();
  Future<TokenModel> putToken({required TokenModel token});
  Future<void> removeToken();
}

class AuthenticatedCacheImpl extends AuthenticatedCache {
  TokenModel? token;
  SecureStorage secureStorage;
  // LocalStorage localStorage;
  AuthenticatedCacheImpl({
    this.token,
    required this.secureStorage,
    // required this.localStorage,
  });

  @override
  Future<TokenModel> getToken() async {
    if (token != null) return token!;

    final String? cachedToken = await secureStorage.getSavedToken();
    if (cachedToken == null) {
      throw LocalDataException(errorMessage: 'ERROR get empty token');
    }

    return TokenModel.fromJson(cachedToken);
  }

  @override
  Future<TokenModel> putToken({required TokenModel token}) async {
    this.token = token;
    await secureStorage.updateToken(token: token);

    return token;
  }

  @override
  Future<void> removeToken() async {
    token = null;

    return await secureStorage.removeToken();
  }
}
