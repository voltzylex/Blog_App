import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:blog_app/features/auth/presentation/pages/signup_page.dart';
import 'package:blog_app/features/auth/presentation/widgets/auth_field.dart';
import 'package:blog_app/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static route() => MaterialPageRoute(builder: (context) => LoginPage());
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  final email = TextEditingController();
  final password = TextEditingController();
  @override
  void dispose() {
    email.dispose();

    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Sign In.",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                AuthField(
                  hint: "Email",
                  controller: email,
                ),
                const SizedBox(height: 15),
                AuthField(
                  hint: "Password",
                  controller: password,
                  isObscure: true,
                ),
                const SizedBox(height: 15),
                AuthGradientButton(
                  buttonText: "Sign In",
                  onPressed: () {
                    formKey.currentState?.validate();
                  },
                ),
                const SizedBox(height: 30),
                CupertinoButton(
                  onPressed: () => Navigator.push(context, SignupPage.route()),
                  child: RichText(
                    text: TextSpan(
                      text: "Don't Have an account? ",
                      style: Theme.of(context).textTheme.titleMedium,
                      children: <InlineSpan>[
                        TextSpan(
                            text: "Sign up",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(color: AppPallete.gradient2, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
