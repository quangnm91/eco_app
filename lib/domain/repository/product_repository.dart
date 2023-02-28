import 'package:eco_app/core/utils/remote_connection.dart';
import 'package:eco_app/core/utils/remote_input.dart';
import 'package:eco_app/domain/repository/base_repository.dart';

import '../response/product_response.dart';
import '../response/products_response.dart';

abstract class ProductRepository {
  Future<ProductsResponse> getProducts(Map<String, dynamic>? queryParameters);
  Future<ProductResponse> getProductById(String id);
}

class ProductRepositoryImpl extends ProductRepository with BaseRepository {
  ProductRepositoryImpl();

  @override
  Future<ProductsResponse> getProducts(
      Map<String, dynamic>? queryParameters) async {
    var header = await buildHeader();
    var request = RemoteInput(
        endPoint: '/products',
        method: RemoteMethod.get,
        header: header,
        body: null,
        queryParameters: queryParameters);
    var json = await RemoteConnection().execute(request);

    return ProductsResponse.fromMap(json);
  }

  @override
  Future<ProductResponse> getProductById(String id) async {
    var header = await buildHeader();
    var request = RemoteInput(
        endPoint: '/products/$id',
        method: RemoteMethod.get,
        header: header,
        body: null,
        queryParameters: null);
    var json = await RemoteConnection().execute(request);

    return ProductResponse.fromMap(json);
  }
}
