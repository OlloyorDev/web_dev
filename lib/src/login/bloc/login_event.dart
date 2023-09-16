part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class SendLoginEvent extends LoginEvent {
  const SendLoginEvent({
    required this.login,
    required this.password,
  });

  final String login;
  final String password;

  @override
  List<Object?> get props => [login, password];
}

class LoginPrivate extends LoginEvent {
  const LoginPrivate();

  @override
  List<Object?> get props => [];
}
