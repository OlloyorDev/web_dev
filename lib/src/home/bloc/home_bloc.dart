import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_devop/src/home/data/model/get_employees_reponse.dart';
import 'package:web_devop/src/home/data/model/salary_create_request_model.dart';
import 'package:web_devop/src/home/data/repository/home_repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required this.homeRepository,
  }) : super(const HomeState()) {
    on<GetEmployeesEvent>(_onGetEmployeesEvent);
    on<AddEmployeeEvent>(_onAddEmployeeEvent);
    on<CreateSalaryEvent>(_createSalaryEvent);
    on<RequiredDetectEvent>(_requiredDetectEvent);
  }

  final HomeRepository homeRepository;

  Future<void> _onGetEmployeesEvent(
    GetEmployeesEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(getEmployeesStatus: GetEmployeesStatus.loading));
    final response = await homeRepository.getEmployees(event.token);
    response.fold((left) {
      emit(state.copyWith(getEmployeesStatus: GetEmployeesStatus.failure));
    }, (right) {
      emit(state.copyWith(
        token: event.token,
        getEmployeesResponse: right,
        getEmployeesStatus: GetEmployeesStatus.success,
      ));
    });
  }

  Future<void> _createSalaryEvent(
    CreateSalaryEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(createSalaryStatus: CreateSalaryStatus.loading));
    final request = await homeRepository.createSalary(
      token: state.token ?? '',
      request: SalaryCreateRequestModel(
        firstname: event.firstname,
        lastName: event.lastname,
        role: event.role,
        salary: event.salary,
        requiredWorkingDaysInMonth: event.requiredWorkingDaysInMonth,
        actualWorkingDaysInMonth: event.actualWorkingDaysInMonth,
        extraLeadershipBonus: event.extraLeadershipBonus,
        extraPersonalBonus: event.extraPersonalBonus,
        extraExperienceBonus: event.extraExperienceBonus,
        travelExpences: event.travelExpenses,
        monthlyNutrition: event.monthlyNutrition,
      ),
    );
    request.fold((left) {
      emit(state.copyWith(createSalaryStatus: CreateSalaryStatus.failure));
    }, (right) {
      emit(state.copyWith(createSalaryStatus: CreateSalaryStatus.success));
    });
  }

  void _onAddEmployeeEvent(
    AddEmployeeEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(addEmployeeStatus: AddEmployeeStatus.isOpen));
  }

  void _requiredDetectEvent(
    RequiredDetectEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(isRequired: !state.isRequired));
  }
}
