part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.token,
    this.isError = false,
    this.isPrivate = true,
    this.loginStatus = LoginStatus.intintial,
  });

  final String? token;
  final bool isError;
  final bool isPrivate;
  final LoginStatus loginStatus;

  LoginState copyWith({
    String? token,
    bool? isError,
    bool? isPrivate,
    LoginStatus? loginStatus,
  }) {
    return LoginState(
      token: token ?? this.token,
      isError: isError ?? this.isError,
      isPrivate: isPrivate ?? this.isPrivate,
      loginStatus: loginStatus ?? LoginStatus.intintial,
    );
  }

  @override
  List<Object?> get props => [
        token,
        isError,
        loginStatus,
        isPrivate,
      ];
}

enum LoginStatus { intintial, loading, success, error }
