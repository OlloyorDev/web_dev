import 'package:dio/dio.dart';
import 'package:web_devop/core/either_dart/either.dart';
import 'package:web_devop/core/platform/network_info.dart';
import 'package:web_devop/domain/home/home_repository.dart';
import 'package:web_devop/domain/network/failure.dart';

class HomeRepositoryImpl extends HomeRepository {
  HomeRepositoryImpl({
    required this.dio,
    required this.networkInfo,
  });

  final Dio dio;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, dynamic>> getSalary({
    required String surveyId,
  }) {
    throw UnimplementedError();
  }
}
