import 'package:dio/dio.dart';
import 'package:web_devop/core/either_dart/either.dart';
import 'package:web_devop/domain/network/failure.dart';

part 'auth_repository_impl.dart';

abstract class AuthRepository {
  const AuthRepository();

  Future<Either<Failure, String>> login({
    required Map<String, dynamic> request,
  });
}
