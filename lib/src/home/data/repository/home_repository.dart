import 'package:web_devop/core/either_dart/either.dart';
import 'package:web_devop/domain/network/failure.dart';
import 'package:web_devop/src/home/data/model/get_employees_reponse.dart';
import 'package:web_devop/src/home/data/model/salary_create_request_model.dart';

abstract class HomeRepository {
  const HomeRepository();

  Future<Either<Failure, GetEmployeesResponse>> getEmployees(
    String token,
  );

  Future<Either<Failure, dynamic>> createSalary({
    required SalaryCreateRequestModel request,
    required String token,
  });
}
