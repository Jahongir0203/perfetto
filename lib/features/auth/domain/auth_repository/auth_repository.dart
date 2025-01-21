import 'package:dartz/dartz.dart';
import 'package:perfetto/core/exceptions/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> getCode({required String phoneNUmber});

  Future<Either<Failure, bool>> verifyCode(
      {required String phoneNumber, required String code});
}
