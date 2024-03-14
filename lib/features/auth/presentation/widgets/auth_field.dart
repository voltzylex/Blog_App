import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final bool? isObscure;
  const AuthField({super.key, required this.hint, required this.controller,this.isObscure});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(hintText: hint),
      obscureText: isObscure?? false,
      validator: (value) {
        if (value!.isEmpty) {
          return "$hint text is empty";
        }
        return null;
      },
    );
  }
}
