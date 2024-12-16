import 'dart:developer';

import 'package:auth_app_2/services/auth_service.dart';
import 'package:auth_app_2/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/input_field.dart';
import '../../components/password_field.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onPressed;
  const LoginPage({
    super.key,
    this.onPressed,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  void login() {
    // get authService
    if (emailController.text != "") {
      if (passwordController.text != "") {
        try {
          final authService = Provider.of<AuthService>(context, listen: false);
          authService.signinWithEmailandPassword(
              emailController.text, passwordController.text);
          CustomSnackBar.show(context, "Success", "Login Successful!");
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              
                content: Text(
              e.toString(),
            )),
          );
        }
      } else {
        CustomSnackBar.show(context, "Error", "Enter Password");
      }
    } else {
      CustomSnackBar.show(context, "Error", "Enter Email");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // app logo
              Column(
                children: [
                  Image.asset(
                    "assets/images/authentication.png",
                    width: 100,
                  ),
                  const SizedBox(height: 30),
                  // title
                  const Text(
                    "LOGIN",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // form
              Column(
                children: [
                  // email field
                  InputField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    icon: Icons.email,
                    labelText: "Email",
                  ),
                  const SizedBox(height: 30),
                  // password field
                  PasswordField(
                    passwordController: passwordController,
                    labelText: "Password",
                  ),
                  // forgot password text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Forgot Password?",
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // login button
                  GestureDetector(
                    onTap: login,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.sizeOf(context).width * 0.35,
                        vertical: 20,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.cyan,
                      ),
                      child: const Text(
                        "LOGIN",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an Account ?"),
                      TextButton(
                        onPressed: widget.onPressed,
                        child: const Text("Register"),
                      ),
                    ],
                  ),
                ],
              ),
              // dont have an account
            ],
          ),
        ),
      ),
    );
  }
}
