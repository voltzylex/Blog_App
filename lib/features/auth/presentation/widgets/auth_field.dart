import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
 final String hint;
  const AuthField({super.key,required this.hint});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hint
      ),
    );
  }
}
