// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import '../../core/errors/exceptions.dart';
import '../../core/errors/failures.dart';
import '../../core/utils/log_helper.dart';
import '../model/address_model.dart';
import '../repository/address_respository.dart';
import '../response/address_response.dart';
import '../response/addresses_response.dart';

abstract class AddressUsecases {
  Future<Either<Failure, AddressesResponse>> getAddresses();
  Future<Either<Failure, AddressResponse>> storeNewAddress(
      {required Address address});
}

class AddressUsecasesImpl extends AddressUsecases {
  AddressRepository repository;
  AddressUsecasesImpl({required this.repository});

  @override
  Future<Either<Failure, AddressesResponse>> getAddresses() async {
    try {
      return Right(await repository.index());
    } on RemoteException catch (e) {
      LogHelper().logger.e(e);
      return Left(RemoteFailure(message: e.errorMessage));
    } catch (e) {
      LogHelper().logger.e(e);
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AddressResponse>> storeNewAddress(
      {required Address address}) async {
    try {
      return Right(await repository.store(address));
    } on RemoteException catch (e) {
      LogHelper().logger.e(e);
      return Left(RemoteFailure(message: e.errorMessage));
    } catch (e) {
      LogHelper().logger.e(e);
      return Left(UnknownFailure(message: e.toString()));
    }
  }
}
