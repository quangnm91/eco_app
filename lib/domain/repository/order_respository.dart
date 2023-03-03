// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../core/utils/remote_connection.dart';
import '../../core/utils/remote_input.dart';
import '../../data/local/authenticated_cache.dart';
import 'base_repository.dart';

abstract class OrderRepository {
  Future<bool> store(int userAddressId, int shoppingSessionId);
}

class OrderRepositoryImpl extends OrderRepository with BaseRepository {
  final AuthenticatedCache authenticatedCache;

  OrderRepositoryImpl({
    required this.authenticatedCache,
  });

  @override
  Future<bool> store(int userAddressId, int shoppingSessionId) async {
    var header = await buildHeader(authCache: authenticatedCache);
    var request = RemoteInput(
        endPoint: '/orders',
        method: RemoteMethod.post,
        header: header,
        body: {
          'user_address_id': userAddressId,
          'shopping_session_id': shoppingSessionId
        },
        queryParameters: null);
    var json = await RemoteConnection().execute(request);
    return true;
  }
}
