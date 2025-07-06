import 'package:flutter/material.dart';
import 'package:home_decor/src/features/screens/forgot_password_screen.dart';
import 'package:home_decor/src/features/screens/home_screen.dart';
import 'package:home_decor/src/features/screens/login_screen.dart';
import 'package:home_decor/src/features/screens/onboarding_screen.dart';
import 'package:home_decor/src/features/screens/set_password_screen.dart';
import 'package:home_decor/src/features/screens/signup_screen.dart';

import 'l10n/l10n.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localeListResolutionCallback: L10n.localeListResolutionCallback,
      localizationsDelegates: L10n.localizationsDelegates,
      supportedLocales: L10n.supportedLocales,
      initialRoute: '/',
      routes: {
        '/': (context) => const OnboardingScreen(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignUpScreen(),
        '/ForgotPassword': (context) => ForgotPasswordScreen(),
        '/SetPassword': (context) => SetPasswordScreen(),
        '/Homepage': (context) => const HomeScreen(),
      },
    );
  }
}
