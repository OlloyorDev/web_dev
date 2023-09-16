import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:web_devop/core/either_dart/either.dart';
import 'package:web_devop/domain/network/failure.dart';
import 'package:web_devop/domain/network/server_error.dart';
import 'package:web_devop/src/home/data/model/get_employees_reponse.dart';
import 'package:web_devop/src/home/data/model/salary_create_request_model.dart';
import 'package:web_devop/src/home/data/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  const HomeRepositoryImpl({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<Either<Failure, GetEmployeesResponse>> getEmployees(
    String token,
  ) async {
    try {
      final Response response = await dio.get(
        'https://salare-info-service.onrender.com/api/employees/',
        options: Options(
          headers: {
            'auth-token': token,
          },
        ),
      );
      return Right(GetEmployeesResponse.fromJson(response.data));
    } on DioException catch (error, stacktrace) {
      log('Exception occurred: $error stacktrace: $stacktrace');
      return Left(
        ServerError.withDioError(error: error).failure,
      );
    } on Exception catch (error, stacktrace) {
      log('Exception occurred: $error stacktrace: $stacktrace');
      return Left(
        ServerError.withError(
          message: error.toString(),
        ).failure,
      );
    }
  }

  @override
  Future<Either<Failure, dynamic>> createSalary({
    required SalaryCreateRequestModel request,
    required String token,
  }) async {
    try {
      final Response response = await dio.post(
        'https://salare-info-service.onrender.com/api/employees/',
        options: Options(
          headers: {
            'auth-token': token,
          },
        ),
        data: request.toJson(),
      );
      return Right(response.data);
    } on DioException catch (error, stacktrace) {
      log('Exception occurred: $error stacktrace: $stacktrace');
      return Left(
        ServerError.withDioError(error: error).failure,
      );
    } on Exception catch (error, stacktrace) {
      log('Exception occurred: $error stacktrace: $stacktrace');
      return Left(
        ServerError.withError(
          message: error.toString(),
        ).failure,
      );
    }
  }
}
