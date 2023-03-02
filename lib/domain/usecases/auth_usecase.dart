import 'package:dartz/dartz.dart';
import 'package:eco_app/domain/repository/auth_respository.dart';
import 'package:eco_app/domain/response/token_response.dart';

import '../../core/errors/exceptions.dart';
import '../../core/errors/failures.dart';
import '../../core/utils/log_helper.dart';

abstract class AuthUsecases {
  Future<Either<Failure, TokenResponse>> signUp(String email, String password);
  Future<Either<Failure, TokenResponse>> signIn(String email, String password);
}

class AuthUsecasesImpl extends AuthUsecases {
  AuthUsecasesImpl({required this.repository});

  final AuthRepository repository;

  @override
  Future<Either<Failure, TokenResponse>> signUp(
      String email, String password) async {
    try {
      return Right(await repository.signUp(email, password));
    } on RemoteException catch (e) {
      LogHelper().logger.e(e);
      return Left(RemoteFailure(message: e.toString()));
    } catch (e) {
      LogHelper().logger.e(e);
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TokenResponse>> signIn(
      String email, String password) async {
    try {
      return Right(await repository.signIn(email, password));
    } on RemoteException catch (e) {
      LogHelper().logger.e(e);
      return Left(RemoteFailure(message: e.toString()));
    } catch (e) {
      LogHelper().logger.e(e);
      return Left(UnknownFailure(message: e.toString()));
    }
  }
}
