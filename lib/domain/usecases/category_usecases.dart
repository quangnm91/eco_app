// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:eco_app/core/utils/log_helper.dart';
import 'package:eco_app/domain/repository/category_repository.dart';

import 'package:eco_app/domain/repository/product_repository.dart';
import 'package:eco_app/domain/response/large_categories_response.dart';
import 'package:eco_app/domain/response/large_category_response.dart';

import '../../core/errors/exceptions.dart';
import '../../core/errors/failures.dart';

abstract class CategoryUsecases {
  Future<Either<Failure, LargeCategoriesResponse>> getLargeCategories();
  Future<Either<Failure, LargeCategoryResponse>> getLargeCategoryById(
      String id);
}

class CategoryUsecasesImpl extends CategoryUsecases {
  final CategoryRepository repository;
  CategoryUsecasesImpl({
    required this.repository,
  });

  @override
  Future<Either<Failure, LargeCategoriesResponse>> getLargeCategories() async {
    try {
      return Right(await repository.getLargeCategories());
    } on RemoteException catch (e) {
      LogHelper().logger.e(e);
      return Left(RemoteFailure(message: e.errorMessage));
    } catch (e) {
      LogHelper().logger.e(e);
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, LargeCategoryResponse>> getLargeCategoryById(
      String id) async {
    try {
      return Right(await repository.getLargeCategoryById(id));
    } on RemoteException catch (e) {
      LogHelper().logger.e(e);
      return Left(RemoteFailure(message: e.errorMessage));
    } catch (e) {
      LogHelper().logger.e(e);
      return Left(UnknownFailure(message: e.toString()));
    }
  }
}
