import '../../core/utils/remote_connection.dart';
import '../../core/utils/remote_input.dart';
import 'base_repository.dart';

abstract class CartRepository {
  Future<bool> add(int productId, int quantity);
}

class CartRepositoryImpl extends CartRepository with BaseRepository {
  @override
  Future<bool> add(int productId, int quantity) async {
    var header = await buildHeader();
    var request = RemoteInput(
        endPoint: '/cart',
        method: RemoteMethod.post,
        header: header,
        body: {'product_id': productId, 'quantity': quantity},
        queryParameters: null);
    var json = await RemoteConnection().execute(request);
    print("cart repository json --> ");
    print(json);
    return true;
  }
}
