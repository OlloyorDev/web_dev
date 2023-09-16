part of 'auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  const AuthRepositoryImpl(
    this.dio,
  );

  final Dio dio;

  @override
  Future<Either<Failure, String>> login({
    required Map<String, dynamic> request,
  }) async {
    try {
      final response = await dio.post(
        'https://salare-info-service.onrender.com/api/login',
        data: request,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(response.data);
      }
    } catch (e) {
      return Left(ServerFailure(message: '$e'));
    }
    return const Left(ServerFailure(message: 'Something went wrong'));
  }
}
