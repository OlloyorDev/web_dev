part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    this.token = '',
    this.isRequired = false,
    this.getEmployeesResponse,
    this.getEmployeesStatus = GetEmployeesStatus.intintial,
    this.addEmployeeStatus = AddEmployeeStatus.intintial,
    this.createSalaryStatus = CreateSalaryStatus.intintial,
  });

  final String? token;
  final bool isRequired;
  final GetEmployeesResponse? getEmployeesResponse;
  final GetEmployeesStatus getEmployeesStatus;
  final AddEmployeeStatus addEmployeeStatus;
  final CreateSalaryStatus createSalaryStatus;

  HomeState copyWith({
    String? token,
    bool? isRequired,
    GetEmployeesResponse? getEmployeesResponse,
    GetEmployeesStatus? getEmployeesStatus,
    AddEmployeeStatus? addEmployeeStatus,
    CreateSalaryStatus? createSalaryStatus,
  }) {
    return HomeState(
      token: token ?? this.token,
      isRequired: isRequired ?? this.isRequired,
      getEmployeesResponse: getEmployeesResponse ?? this.getEmployeesResponse,
      getEmployeesStatus: getEmployeesStatus ?? GetEmployeesStatus.intintial,
      addEmployeeStatus: addEmployeeStatus ?? AddEmployeeStatus.intintial,
      createSalaryStatus: createSalaryStatus ?? CreateSalaryStatus.intintial,
    );
  }

  @override
  List<Object?> get props => [
        token,
        isRequired,
        getEmployeesResponse,
        getEmployeesStatus,
        addEmployeeStatus,
        createSalaryStatus,
      ];
}

enum GetEmployeesStatus { intintial, loading, success, failure }

enum CreateSalaryStatus { intintial, loading, success, failure }

enum AddEmployeeStatus { intintial, isOpen, isClose }

extension GetEmployeesStatusX on GetEmployeesStatus {
  bool get isInitial => this == GetEmployeesStatus.intintial;

  bool get isLoading => this == GetEmployeesStatus.loading;

  bool get isSuccess => this == GetEmployeesStatus.success;

  bool get isFailure => this == GetEmployeesStatus.failure;
}

extension CreateSalaryStatusX on CreateSalaryStatus {
  bool get isInitial => this == CreateSalaryStatus.intintial;

  bool get isLoading => this == CreateSalaryStatus.loading;

  bool get isSuccess => this == CreateSalaryStatus.success;

  bool get isFailure => this == CreateSalaryStatus.failure;
}

extension AddEmployeeStatusX on AddEmployeeStatus {
  bool get isInitial => this == AddEmployeeStatus.intintial;

  bool get isOpen => this == AddEmployeeStatus.isOpen;

  bool get isClose => this == AddEmployeeStatus.isClose;
}
