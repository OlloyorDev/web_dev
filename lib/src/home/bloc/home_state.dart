part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    this.token = '',
    this.isRequired = false,
    this.getEmployeesResponse,
    this.getEmployeesStatus = GetEmployeesStatus.intintial,
    this.drawerStatus = DrawerStatus.intintial,
    this.createSalaryStatus = CreateSalaryStatus.intintial,
    this.deleteSalaryStatus = DeleteSalaryStatus.intintial,
  });

  final String? token;
  final bool isRequired;
  final GetEmployeesResponse? getEmployeesResponse;
  final GetEmployeesStatus getEmployeesStatus;
  final DrawerStatus drawerStatus;
  final CreateSalaryStatus createSalaryStatus;
  final DeleteSalaryStatus deleteSalaryStatus;

  HomeState copyWith({
    String? token,
    bool? isRequired,
    GetEmployeesResponse? getEmployeesResponse,
    GetEmployeesStatus? getEmployeesStatus,
    DrawerStatus? addEmployeeStatus,
    CreateSalaryStatus? createSalaryStatus,
    DeleteSalaryStatus? deleteSalaryStatus,
  }) {
    return HomeState(
      token: token ?? this.token,
      isRequired: isRequired ?? this.isRequired,
      getEmployeesResponse: getEmployeesResponse ?? this.getEmployeesResponse,
      getEmployeesStatus: getEmployeesStatus ?? GetEmployeesStatus.intintial,
      drawerStatus: addEmployeeStatus ?? DrawerStatus.intintial,
      createSalaryStatus: createSalaryStatus ?? CreateSalaryStatus.intintial,
      deleteSalaryStatus: deleteSalaryStatus ?? DeleteSalaryStatus.intintial,
    );
  }

  @override
  List<Object?> get props => [
        token,
        isRequired,
        getEmployeesResponse,
        getEmployeesStatus,
        drawerStatus,
        createSalaryStatus,
        deleteSalaryStatus,
      ];
}

enum GetEmployeesStatus { intintial, loading, success, failure }

enum CreateSalaryStatus { intintial, loading, success, failure }

enum DeleteSalaryStatus { intintial, loading, success, failure }

enum DrawerStatus { intintial, isOpen, isClose }

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

extension AddEmployeeStatusX on DrawerStatus {
  bool get isInitial => this == DrawerStatus.intintial;

  bool get isOpen => this == DrawerStatus.isOpen;

  bool get isClose => this == DrawerStatus.isClose;
}

extension DeleteSalaryStatusX on DeleteSalaryStatus {
  bool get isInitial => this == DeleteSalaryStatus.intintial;

  bool get isLoading => this == DeleteSalaryStatus.loading;

  bool get isSuccess => this == DeleteSalaryStatus.success;

  bool get isFailure => this == DeleteSalaryStatus.failure;
}
