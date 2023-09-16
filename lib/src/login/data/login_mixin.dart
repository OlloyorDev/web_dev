import 'package:flutter/material.dart';
import 'package:web_devop/src/login/presentation/login_page.dart';
import 'package:http/http.dart' as http;

mixin LoginMixin on State<LoginScreen> {
  late TextEditingController loginController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    loginController = TextEditingController(text: 'Olloyor');
    passwordController = TextEditingController(text: 'Mars87');
  }

  @override
  void dispose() {
    super.dispose();
    loginController.dispose();
    passwordController.dispose();
  }
}
