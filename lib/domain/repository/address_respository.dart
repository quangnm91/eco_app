// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:eco_app/domain/model/address_model.dart';
import 'package:eco_app/domain/response/address_response.dart';
import 'package:eco_app/domain/response/addresses_response.dart';

import '../../core/utils/remote_connection.dart';
import '../../core/utils/remote_input.dart';
import '../../data/local/authenticated_cache.dart';
import 'base_repository.dart';

abstract class AddressRepository {
  Future<AddressesResponse> index();
  Future<AddressResponse> store(Address address);
}

class AddressRepositoryImpl extends AddressRepository with BaseRepository {
  final AuthenticatedCache authenticatedCache;
  AddressRepositoryImpl({required this.authenticatedCache});

  @override
  Future<AddressesResponse> index() async {
    var header = await buildHeader(authCache: authenticatedCache);
    var request = RemoteInput(
        endPoint: '/addresses',
        method: RemoteMethod.get,
        header: header,
        body: null,
        queryParameters: null);
    var json = await RemoteConnection().execute(request);

    return AddressesResponse.fromMap(json);
  }

  @override
  Future<AddressResponse> store(Address address) async {
    var header = await buildHeader(authCache: authenticatedCache);
    var request = RemoteInput(
        endPoint: '/addresses',
        method: RemoteMethod.post,
        header: header,
        body: address.toJson(),
        queryParameters: null);
    var json = await RemoteConnection().execute(request);

    return AddressResponse.fromMap(json);
  }
}
