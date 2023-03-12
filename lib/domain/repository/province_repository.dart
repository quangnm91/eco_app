import 'package:eco_app/domain/response/provinces_response.dart';

import '../../core/utils/remote_connection.dart';
import '../../core/utils/remote_input.dart';
import 'base_repository.dart';

abstract class ProvinceRepository {
  Future<ProvincesResponse> getProvinces(Map<String, dynamic>? queryParameters);
}

class ProvinceRepositoryImpl extends ProvinceRepository with BaseRepository {
  ProvinceRepositoryImpl();

  @override
  Future<ProvincesResponse> getProvinces(
      Map<String, dynamic>? queryParameters) async {
    var header = await buildHeader();
    var request = RemoteInput(
        endPoint: '/provinces',
        method: RemoteMethod.get,
        header: header,
        body: null,
        queryParameters: queryParameters);
    var json = await RemoteConnection().execute(request);

    return ProvincesResponse.fromMap(json);
  }
}
