import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextInputType? keyboardType;
  final String? labelText;
  final IconData? icon;
  final controller;
  const InputField({
    super.key,
    required this.keyboardType,
    required this.labelText,
    required this.icon, required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30.0,
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: Icon(icon),
          focusColor: Colors.blue[50],
          prefixIconColor: Colors.black,
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
