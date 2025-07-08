import 'package:flutter/material.dart';
import 'package:home_decor/main_screen.dart';
import 'package:home_decor/src/features/screens/auth/forgot_password_screen.dart';
import 'package:home_decor/src/features/screens/auth/login_screen.dart';
import 'package:home_decor/src/features/screens/card_screen.dart';
import 'package:home_decor/src/features/screens/home_screen.dart';
import 'package:home_decor/src/features/screens/list_screen.dart';
import 'package:home_decor/src/features/screens/onboarding_screen.dart';
import 'package:home_decor/src/features/screens/auth/set_password_screen.dart';
import 'package:home_decor/src/features/screens/auth/signup_screen.dart';

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
        '/MainScreen': (context) => MainScreen(),
        '/login': (context) => LoginScreen(),
        '/CreateAccountScreen': (context) => CreateAccountScreen(),
        '/ForgotPassword': (context) => ForgotPasswordScreen(),
        '/SetPassword': (context) => SetPasswordScreen(),
        '/HomeScreen': (context) => HomeScreen(),
        '/ListScreen': (context) => ListScreen(),
        '/CardScreen': (context) => CardScreen(),
      },
    );
  }
}
