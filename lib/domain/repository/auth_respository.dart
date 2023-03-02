import 'package:eco_app/domain/response/token_response.dart';

import '../../core/utils/remote_connection.dart';
import '../../core/utils/remote_input.dart';
import 'base_repository.dart';

abstract class AuthRepository {
  Future<TokenResponse> signUp(String email, String password);
  Future<TokenResponse> signIn(String email, String password);
}

class AuthRepositoryImpl extends AuthRepository with BaseRepository {
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
}
