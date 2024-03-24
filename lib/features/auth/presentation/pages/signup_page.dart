import 'dart:developer';

import 'package:blog_app/core/common/utils/show_snackbar.dart';
import 'package:blog_app/core/common/widgets/loader.dart';
import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:blog_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:blog_app/features/auth/presentation/widgets/auth_field.dart';
import 'package:blog_app/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const SignupPage());
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final formKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  @override
  void dispose() {
    email.dispose();
    name.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            log("Sign up response ${state.message}");
            showSnackBar(context, message: state.message);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Loader();
          }
          return Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Sign Up.",
                      style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    AuthField(
                      hint: "Name",
                      controller: name,
                    ),
                    const SizedBox(height: 15),
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
                      buttonText: "Sign Up",
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          log("Sign up button called");
                          context.read<AuthBloc>().add(
                                AuthSignUp(
                                  name: name.text.trim(),
                                  email: email.text.trim().toLowerCase(),
                                  password: password.text.trim(),
                                ),
                              );
                        }
                      },
                    ),
                    const SizedBox(height: 30),
                    CupertinoButton(
                      onPressed: () => Navigator.pop(
                        context,
                      ),
                      child: RichText(
                        text: TextSpan(
                          text: "Already Have an account? ",
                          style: Theme.of(context).textTheme.titleMedium,
                          children: <InlineSpan>[
                            TextSpan(
                                text: "Sign in",
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
          );
        },
      ),
    );
  }
}
