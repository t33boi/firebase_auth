import 'package:auth_app_2/screens/auth/login_page.dart';
import 'package:auth_app_2/screens/auth/register_page.dart';
import 'package:flutter/material.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool isActive = true;
  void toggle() {
    setState(() {
      isActive = !isActive;
    });
  }

  Widget build(BuildContext context) {
    if (isActive) {
      return LoginPage(
        onPressed: toggle,
      );
    } else {
      return RegisterPage(
        onPressed: toggle,
      );
    }
  }
}
