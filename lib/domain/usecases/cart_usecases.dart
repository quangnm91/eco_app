import 'package:dartz/dartz.dart';

import '../../core/errors/exceptions.dart';
import '../../core/errors/failures.dart';
import '../../core/utils/log_helper.dart';
import '../repository/cart_repository.dart';

abstract class CartUsecases {
  Future<Either<Failure, bool>> add(int productId, int quantity);
}

class CartUsecasesImpl extends CartUsecases {
  CartUsecasesImpl({required this.repository});

  final CartRepository repository;

  @override
  Future<Either<Failure, bool>> add(int productId, int quantity) async {
    try {
      return Right(await repository.add(productId, quantity));
    } on RemoteException catch (e) {
      LogHelper().logger.e(e);
      return Left(RemoteFailure(message: e.toString()));
    } catch (e) {
      LogHelper().logger.e(e);
      return Left(UnknownFailure(message: e.toString()));
    }
  }
}
