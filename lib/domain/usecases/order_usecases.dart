// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import '../../core/errors/exceptions.dart';
import '../../core/errors/failures.dart';
import '../../core/utils/log_helper.dart';
import '../repository/order_respository.dart';
import '../response/orders_response.dart';

abstract class OrderUsecases {
  Future<Either<Failure, bool>> store(
      {required int userAddressId, required int shoppingSessionId});
  Future<Either<Failure, OrdersResponse>> get();
}

class OrderUsecasesImpl extends OrderUsecases {
  final OrderRepository repository;

  OrderUsecasesImpl({
    required this.repository,
  });

  @override
  Future<Either<Failure, bool>> store(
      {required int userAddressId, required int shoppingSessionId}) async {
    try {
      return Right(await repository.store(userAddressId, shoppingSessionId));
    } on RemoteException catch (e) {
      LogHelper().logger.e(e);
      return Left(RemoteFailure(message: e.errorMessage));
    } catch (e) {
      LogHelper().logger.e(e);
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, OrdersResponse>> get() async {
    try {
      return Right(await repository.get());
    } on RemoteException catch (e) {
      LogHelper().logger.e(e);
      return Left(RemoteFailure(message: e.errorMessage));
    } catch (e) {
      LogHelper().logger.e(e);
      return Left(UnknownFailure(message: e.toString()));
    }
  }
}
