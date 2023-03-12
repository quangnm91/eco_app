// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../core/utils/remote_connection.dart';
import '../../core/utils/remote_input.dart';
import '../../data/local/authenticated_cache.dart';
import '../response/cart_response.dart';
import 'base_repository.dart';

abstract class CartRepository {
  Future<CartResponse> add(int productId, int quantity);
  Future<CartResponse> get();
  Future<CartResponse> update(int cartItemId, int quantity);
  Future<CartResponse> delete(int cartItemId);
}

class CartRepositoryImpl extends CartRepository with BaseRepository {
  final AuthenticatedCache authenticatedCache;

  CartRepositoryImpl({
    required this.authenticatedCache,
  });

  @override
  Future<CartResponse> add(int productId, int quantity) async {
    var header = await buildHeader(authCache: authenticatedCache);
    var request = RemoteInput(
        endPoint: '/cart',
        method: RemoteMethod.post,
        header: header,
        body: {'product_id': productId, 'quantity': quantity},
        queryParameters: null);
    var json = await RemoteConnection().execute(request);
    print("cart repository json --> ");
    print(json);
    return CartResponse.fromMap(json);
  }

  @override
  Future<CartResponse> get() async {
    var header = await buildHeader(authCache: authenticatedCache);
    print('header ---> ${header}');
    var request = RemoteInput(
        endPoint: '/cart',
        method: RemoteMethod.get,
        header: header,
        body: null,
        queryParameters: null);
    var json = await RemoteConnection().execute(request);

    return CartResponse.fromMap(json);
  }

  @override
  Future<CartResponse> update(int cartItemId, int quantity) async {
    var header = await buildHeader(authCache: authenticatedCache);
    print('header ---> ${header}');
    var request = RemoteInput(
        endPoint: '/cart/$cartItemId',
        method: RemoteMethod.put,
        header: header,
        body: {'quantity': quantity},
        queryParameters: null);
    var json = await RemoteConnection().execute(request);

    return CartResponse.fromMap(json);
  }

  @override
  Future<CartResponse> delete(int cartItemId) async {
    var header = await buildHeader(authCache: authenticatedCache);
    print('header ---> ${header}');
    var request = RemoteInput(
        endPoint: '/cart/$cartItemId',
        method: RemoteMethod.delete,
        header: header,
        body: null,
        queryParameters: null);
    var json = await RemoteConnection().execute(request);

    return CartResponse.fromMap(json);
  }
}
