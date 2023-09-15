
import 'package:web_devop/core/either_dart/either.dart';
import 'package:web_devop/domain/network/failure.dart';

abstract class HomeRepository {
  const HomeRepository();

  Future<Either<Failure, dynamic>> getSalary({
    required String surveyId,
  });
}
