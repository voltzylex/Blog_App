import 'package:blog_app/features/auth/presentation/widgets/auth_field.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sign Up.",
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            AuthField(hint: "Name"),
            SizedBox(height: 15),
            AuthField(hint: "Email"),
            SizedBox(height: 15),
            AuthField(hint: "Password"),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
