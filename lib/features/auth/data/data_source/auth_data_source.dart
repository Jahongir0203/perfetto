import 'package:dio/dio.dart';
import 'package:perfetto/core/exceptions/exceptions.dart';

abstract class AuthDataSource {
  Future<bool> getCode({required String phoneNUmber});

  Future<bool> verifyCode({required String phoneNumber, required String code});
}

class AuthDataSourceImpl extends AuthDataSource {
  final Dio _dio = Dio();

  @override
  Future<bool> getCode({required String phoneNUmber}) async {
    final response = await _dio.post(
      'http://45.138.158.239:7868/api/Customer/send-verification-code',
      options: Options(headers: {"Content-Type": "application/json"}),
      data: {
        "phoneNumber": phoneNUmber,
      },
    );

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return response.data;
    } else {
      throw ServerException(
          statusCode: response.statusCode ?? 500, errorMessage: response.data);
    }
  }

  @override
  Future<bool> verifyCode(
      {required String phoneNumber, required String code}) async {
    final response = await _dio.post(
      'http://45.138.158.239:7868/api/Customer/verify-code',
      options: Options(headers: {"Content-Type": "application/json"}),
      data: {
        "phoneNumber": phoneNumber,
        "verifyCode": code,
      },
    );

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return response.data;
    } else {
      throw ServerException(
          statusCode: response.statusCode ?? 500, errorMessage: response.data);
    }
  }
}
