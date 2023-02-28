import 'package:dartz/dartz.dart';
import 'package:eco_app/core/errors/failures.dart';
import 'package:eco_app/domain/repository/base_repository.dart';

import '../../core/errors/exceptions.dart';
import '../../core/utils/remote_connection.dart';
import '../../core/utils/remote_input.dart';
import '../response/large_categories_response.dart';
import '../response/large_category_response.dart';

abstract class CategoryRepository {
  Future<LargeCategoriesResponse> getLargeCategories();
  Future<LargeCategoryResponse> getLargeCategoryById(String id);
}

class CategoryRepositoryImpl extends CategoryRepository with BaseRepository {
  @override
  Future<LargeCategoriesResponse> getLargeCategories() async {
    var header = await buildHeader();
    var request = RemoteInput(
        endPoint: '/large-categories',
        method: RemoteMethod.get,
        header: header,
        body: null,
        queryParameters: null);
    var json = await RemoteConnection().execute(request);
    print("large category ---> ");
    print(json);
    return LargeCategoriesResponse.fromMap(json);
  }

  @override
  Future<LargeCategoryResponse> getLargeCategoryById(String id) async {
    var header = await buildHeader();
    var request = RemoteInput(
        endPoint: '/large-categories/$id',
        method: RemoteMethod.get,
        header: header,
        body: null,
        queryParameters: null);
    var json = await RemoteConnection().execute(request);

    return LargeCategoryResponse.fromMap(json);
  }
}
