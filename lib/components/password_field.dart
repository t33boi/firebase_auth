import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final String? labelText;
  final passwordController;
  const PasswordField({
    super.key,
    required this.labelText, required this.passwordController,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isVisible = true;
  void togglePasswordVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30.0,
      ),
      child: TextField(
        controller: widget.passwordController,
        keyboardType: TextInputType.visiblePassword,
        obscureText: _isVisible,
        decoration: InputDecoration(
          labelText: widget.labelText,
          prefixIcon: const Icon(Icons.lock),
          prefixIconColor: Colors.black,
          suffixIconColor: Colors.black,
          suffixIcon: IconButton(
            onPressed: togglePasswordVisibility,
            icon: _isVisible
                ? const Icon(Icons.visibility)
                : const Icon(Icons.visibility_off),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
