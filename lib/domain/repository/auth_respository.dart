// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:eco_app/data/local/authenticated_cache.dart';
import 'package:eco_app/domain/response/token_response.dart';

import '../../core/utils/remote_connection.dart';
import '../../core/utils/remote_input.dart';
import 'base_repository.dart';

abstract class AuthRepository {
  Future<TokenResponse> signUp(String email, String password);
  Future<TokenResponse> signIn(String email, String password);
  Future<bool> logout();
}

class AuthRepositoryImpl extends AuthRepository with BaseRepository {
  final AuthenticatedCache authenticatedCache;
  AuthRepositoryImpl({
    required this.authenticatedCache,
  });
  @override
  Future<TokenResponse> signUp(String email, String password) async {
    var header = await buildHeader();
    var request = RemoteInput(
        endPoint: '/register',
        method: RemoteMethod.post,
        header: header,
        body: {'email': email, 'password': password},
        queryParameters: null);
    var json = await RemoteConnection().execute(request);

    return TokenResponse.fromMap(json);
  }

  @override
  Future<TokenResponse> signIn(String email, String password) async {
    var header = await buildHeader();
    var request = RemoteInput(
        endPoint: '/login',
        method: RemoteMethod.post,
        header: header,
        body: {'email': email, 'password': password},
        queryParameters: null);
    var json = await RemoteConnection().execute(request);

    return TokenResponse.fromMap(json);
  }

  @override
  Future<bool> logout() async {
    var header = await buildHeader(authCache: authenticatedCache);
    var request = RemoteInput(
        endPoint: '/logout',
        method: RemoteMethod.delete,
        header: header,
        body: null,
        queryParameters: null);
    await RemoteConnection().execute(request);

    return true;
  }
}
