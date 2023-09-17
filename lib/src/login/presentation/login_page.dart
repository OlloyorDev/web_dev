import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_devop/components/custom_text_field.dart';
import 'package:web_devop/components/utils/utils.dart';
import 'package:web_devop/src/home/bloc/home_bloc.dart';
import 'package:web_devop/src/home/data/repository/home_repository_impl.dart';
import 'package:web_devop/src/home/presentation/screen/home_screen.dart';
import 'package:web_devop/src/login/bloc/login_bloc.dart';
import 'package:web_devop/src/login/data/login_mixin.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with LoginMixin {
  bool suffixIcon = false;

  @override
  Widget build(BuildContext context) => BlocConsumer<LoginBloc, LoginState>(
        listener: (_, state) {
          if (state.loginStatus == LoginStatus.success) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => BlocProvider(
                  create: (_) => HomeBloc(
                    homeRepository: HomeRepositoryImpl(dio: Dio()),
                  ),
                  child: HomeScreen(
                    token: state.token ?? '',
                  ),
                ),
              ),
            );
          }
        },
        builder: (_, state) => Scaffold(
          body: Center(
            child: Ink(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppUtils.kSpacer,
                  const Text(
                    'Abbos Company Inc',
                    style: TextStyle(fontSize: 25),
                  ),
                  AppUtils.kGap64,
                  CustomTextField(
                    titleText: 'Логин',
                    controller: loginController,
                    onChanged: (v) {},
                    errorText: 'Неправильный логин или пароль',
                    showError: state.isError,
                  ),
                  AppUtils.kGap20,
                  CustomTextField(
                    titleText: 'Пароль',
                    controller: passwordController,
                    onChanged: (v) {
                      if (passwordController.text.isNotEmpty) {
                        suffixIcon = true;
                      } else {
                        suffixIcon = false;
                      }
                      setState(() {});
                    },
                    errorText: 'Неправильный логин или пароль',
                    showError: state.isError,
                    obscureText: state.isPrivate,
                    suffixIcon: suffixIcon ? IconButton(
                      onPressed: () {
                        context.read<LoginBloc>().add(
                              const LoginPrivate(),
                            );
                      },
                      icon: state.isPrivate
                          ? const Icon(
                              Icons.visibility,
                              size: 20,
                            )
                          : const Icon(
                              Icons.visibility_off,
                              size: 20,
                            ),
                    ) : null,
                  ),
                  AppUtils.kGap20,
                  ElevatedButton(
                    onPressed: () async {
                      if (loginController.text.isNotEmpty ||
                          passwordController.text.isNotEmpty) {
                        context.read<LoginBloc>().add(
                              SendLoginEvent(
                                login: loginController.text,
                                password: passwordController.text,
                              ),
                            );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Login or password is empty',
                            ),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      'Войти',
                    ),
                  ),
                  SizedBox(
                    height: 60,
                    child: Visibility(
                      visible: state.loginStatus == LoginStatus.loading,
                      child: Column(
                        children: [
                          AppUtils.kGap15,
                          state.loginStatus == LoginStatus.loading
                              ? const Center(
                                  child: CupertinoActivityIndicator(),
                                )
                              : AppUtils.kGap,
                        ],
                      ),
                    ),
                  ),
                  AppUtils.kSpacer,
                ],
              ),
            ),
          ),
        ),
      );
}
