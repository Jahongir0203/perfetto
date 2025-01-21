import 'package:dartz/dartz.dart';
import 'package:perfetto/core/exceptions/exceptions.dart';
import 'package:perfetto/core/exceptions/failure.dart';
import 'package:perfetto/features/auth/data/data_source/auth_data_source.dart';
import 'package:perfetto/features/auth/domain/auth_repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthDataSource authDataSource;

  AuthRepositoryImpl({required this.authDataSource});

  @override
  Future<Either<Failure, bool>> getCode({required String phoneNUmber}) async {
    try {
      final response = await authDataSource.getCode(phoneNUmber: phoneNUmber);
      return Right(response);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(
            errorMessage: e.errorMessage ?? '', statusCode: e.statusCode),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> verifyCode(
      {required String phoneNumber, required String code}) async {
    try {
      final response =
          await authDataSource.verifyCode(phoneNumber: phoneNumber, code: code);
      return Right(response);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(
            errorMessage: e.errorMessage ?? '', statusCode: e.statusCode),
      );
    }
  }
}
