import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_devop/src/login/data/login/auth_repository.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(
    this.authRepository,
  ) : super(const LoginState()) {
    on<SendLoginEvent>(_onSendLoginEvent);
    on<LoginPrivate>(_loginPrivate);
  }

  final AuthRepository authRepository;

  Future<void> _onSendLoginEvent(
    SendLoginEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(loginStatus: LoginStatus.loading));
    final request = await authRepository.login(
      request: {
        "name": event.login,
        "password": event.password,
      },
    );
    request.fold((left) {
      emit(state.copyWith(
        isError: true,
        loginStatus: LoginStatus.error,
      ));
    }, (right) {
      emit(state.copyWith(
        token: right,
        loginStatus: LoginStatus.success,
      ));
    });
  }

  void _loginPrivate(
    LoginPrivate event,
    Emitter<LoginState> emit,
  ) {
    emit(
      state.copyWith(
        isPrivate: !state.isPrivate,
      ),
    );
  }
}
