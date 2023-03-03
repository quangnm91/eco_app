import 'package:dartz/dartz.dart';

import '../../core/errors/exceptions.dart';
import '../../core/errors/failures.dart';
import '../../core/utils/log_helper.dart';
import '../repository/cart_repository.dart';
import '../response/cart_response.dart';

abstract class CartUsecases {
  Future<Either<Failure, CartResponse>> add(int productId, int quantity);
  Future<Either<Failure, CartResponse>> get();
  Future<Either<Failure, CartResponse>> update(
      {required int cartItemId, required int quantity});
  Future<Either<Failure, CartResponse>> delete({required int cartItemId});
}

class CartUsecasesImpl extends CartUsecases {
  CartUsecasesImpl({required this.repository});

  final CartRepository repository;

  @override
  Future<Either<Failure, CartResponse>> add(int productId, int quantity) async {
    try {
      return Right(await repository.add(productId, quantity));
    } on RemoteException catch (e) {
      LogHelper().logger.e(e);
      return Left(RemoteFailure(message: e.errorMessage));
    } catch (e) {
      LogHelper().logger.e(e);
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CartResponse>> get() async {
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

  @override
  Future<Either<Failure, CartResponse>> delete(
      {required int cartItemId}) async {
    try {
      return Right(await repository.delete(cartItemId));
    } on RemoteException catch (e) {
      LogHelper().logger.e(e);
      return Left(RemoteFailure(message: e.errorMessage));
    } catch (e) {
      LogHelper().logger.e(e);
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CartResponse>> update(
      {required int cartItemId, required int quantity}) async {
    try {
      return Right(await repository.update(cartItemId, quantity));
    } on RemoteException catch (e) {
      LogHelper().logger.e(e);
      return Left(RemoteFailure(message: e.errorMessage));
    } catch (e) {
      LogHelper().logger.e(e);
      return Left(UnknownFailure(message: e.toString()));
    }
  }
}
