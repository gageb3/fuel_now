import 'package:flutter/material.dart';
import 'screens/auth/login_screen.dart';

// Defines global app config
class FuelNowApp extends StatelessWidget {
  const FuelNowApp({super.key});

  // Decides app title, debug settings, and First Screen (home)
  // MaterialApp is not a screen, it is the environment
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FuelNow',
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}
