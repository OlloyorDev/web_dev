part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class GetEmployeesEvent extends HomeEvent {
  const GetEmployeesEvent({required this.token});

  final String token;

  @override
  List<Object?> get props => [token];
}

class AddEmployeeEvent extends HomeEvent {
  const AddEmployeeEvent({
    required this.isAddEmployee,
  });

  final DrawerStatus isAddEmployee;

  @override
  List<Object?> get props => [isAddEmployee];
}

class CreateSalaryEvent extends HomeEvent {
  final String firstname;
  final String lastname;
  final String role;
  final int salary;
  final int requiredWorkingDaysInMonth;
  final int actualWorkingDaysInMonth;
  final int extraLeadershipBonus;
  final int extraPersonalBonus;
  final int extraExperienceBonus;
  final int travelExpenses;
  final int monthlyNutrition;

  const CreateSalaryEvent({
    required this.firstname,
    required this.lastname,
    required this.role,
    required this.salary,
    required this.requiredWorkingDaysInMonth,
    required this.actualWorkingDaysInMonth,
    required this.extraLeadershipBonus,
    required this.extraPersonalBonus,
    required this.extraExperienceBonus,
    required this.travelExpenses,
    required this.monthlyNutrition,
  });

  @override
  List<Object?> get props => [
        firstname,
        lastname,
        role,
        salary,
        requiredWorkingDaysInMonth,
        actualWorkingDaysInMonth,
        extraLeadershipBonus,
        extraPersonalBonus,
        extraExperienceBonus,
        travelExpenses,
        monthlyNutrition,
      ];
}

class RequiredDetectEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class DeleteSalaryEvent extends HomeEvent {
  const DeleteSalaryEvent({
    required this.id,
  });

  final String id;

  @override
  List<Object?> get props => [];
}

class DrawerControlEvent extends HomeEvent {
  const DrawerControlEvent({
    required this.drawerStatus,
  });

  final DrawerStatus drawerStatus;

  @override
  List<Object?> get props => [drawerStatus];
}
