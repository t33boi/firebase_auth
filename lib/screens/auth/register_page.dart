import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/input_field.dart';
import '../../components/password_field.dart';
import '../../services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onPressed;
  const RegisterPage({
    super.key,
    this.onPressed,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final fullnameController = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void register() async {
    if (confirmPasswordController.text != passwordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("passwords don't match"),
        ),
      );
      return;
    }
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      authService.signUpWithEmailAndPassword(
          emailcontroller.text, passwordController.text,fullnameController.text);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
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
              Column(
                children: [
                  // app logo
                  Image.asset(
                    "assets/images/authentication.png",
                    width: 100,
                  ),
                  const SizedBox(height: 30),
                  // title
                  const Text(
                    "REGISTER",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              // form
              Column(
                children: [
                  // full name input
                  InputField(
                    controller: fullnameController,
                    keyboardType: TextInputType.name,
                    labelText: "Full Name",
                    icon: Icons.person,
                  ),
                  const SizedBox(height: 20),
                  // email input
                  InputField(
                    controller: emailcontroller,
                    keyboardType: TextInputType.emailAddress,
                    icon: Icons.email,
                    labelText: "Email",
                  ),
                  const SizedBox(height: 20),
                  PasswordField(
                    passwordController: passwordController,
                    labelText: "Password",
                  ),
                  const SizedBox(height: 20),
                  PasswordField(
                    passwordController: confirmPasswordController,
                    labelText: "Confirm Password",
                  ),
                  const SizedBox(height: 20),
                  // register button
                  GestureDetector(
                    onTap: register,
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
                        "REGISTER",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // already have an account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  TextButton(
                    onPressed: widget.onPressed,
                    child: const Text("Login"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
