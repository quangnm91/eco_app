// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:eco_app/core/utils/log_helper.dart';

import 'package:eco_app/domain/repository/product_repository.dart';

import '../../core/errors/exceptions.dart';
import '../../core/errors/failures.dart';
import '../response/product_response.dart';
import '../response/products_response.dart';

abstract class ProductUsecases {
  Future<Either<Failure, ProductsResponse>> getProducts(
      {Map<String, dynamic>? queryParameters});
  Future<Either<Failure, ProductResponse>> getProductById(int id);
}

class ProductUsecasesImpl extends ProductUsecases {
  final ProductRepository repository;
  ProductUsecasesImpl({
    required this.repository,
  });

  @override
  Future<Either<Failure, ProductResponse>> getProductById(int id) async {
    try {
      return Right(await repository.getProductById(id));
    } on RemoteException catch (e) {
      LogHelper().logger.e(e);
      return Left(RemoteFailure(message: e.errorMessage));
    } catch (e) {
      LogHelper().logger.e(e);
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProductsResponse>> getProducts(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      return Right(await repository.getProducts(queryParameters));
    } on RemoteException catch (e) {
      LogHelper().logger.e(e);
      return Left(RemoteFailure(message: e.errorMessage));
    } catch (e) {
      LogHelper().logger.e(e);
      return Left(UnknownFailure(message: e.toString()));
    }
  }
}
