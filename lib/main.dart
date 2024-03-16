import 'package:blog_app/core/secrets/app_secreats.dart';
import 'package:blog_app/core/theme/theme.dart';
import 'package:blog_app/features/auth/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: AppSecrets.supabaseUrl, anonKey: AppSecrets.supabaseUrl);    

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Blog App",
      theme: AppTheme.darkThemeMode,
      home: const LoginPage(),
    );
  }
}
