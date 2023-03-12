// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import '../../core/errors/exceptions.dart';
import '../../core/errors/failures.dart';
import '../../core/utils/log_helper.dart';
import '../repository/province_repository.dart';
import '../response/provinces_response.dart';

abstract class ProvinceUsecases {
  Future<Either<Failure, ProvincesResponse>> getProvinces(
      {Map<String, dynamic>? queryParameters});
}

class ProvinceUsecasesImpl extends ProvinceUsecases {
  final ProvinceRepository repository;
  ProvinceUsecasesImpl({required this.repository});

  @override
  Future<Either<Failure, ProvincesResponse>> getProvinces(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      return Right(await repository.getProvinces(null));
    } on RemoteException catch (e) {
      LogHelper().logger.e(e);
      return Left(RemoteFailure(message: e.errorMessage));
    } catch (e) {
      LogHelper().logger.e(e);
      return Left(UnknownFailure(message: e.toString()));
    }
  }
}
