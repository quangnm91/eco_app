import 'package:eco_app/data/local/authenticated_cache.dart';
import 'package:eco_app/domain/model/token_model.dart';

abstract class BaseRepository {
  Future<Map<String, String>> defaultHeader(
      {TokenModel? token,
      String contentType = 'application/json',
      String acceptType = 'application/json'}) async {
    var header = {
      'Content-Type': contentType,
      'Accept': acceptType,
    };
    if (token != null) {
      header['Authorization'] = "${token.tokenType} ${token.accessToken}";
    }

    return header;
  }

  Future<Map<String, String>> buildHeader(
      {AuthenticatedCache? authCache}) async {
    if (authCache == null) return defaultHeader();
    final token = await authCache.getToken();
    var header = defaultHeader(token: token);
    return header;
  }
}
