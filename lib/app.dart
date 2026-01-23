import 'package:flutter/material.dart';
import 'screens/auth/login_screen.dart';

// Stateless, exists for lifetime of the app, never changes
// Configures global app behavior (theme, title, navigation entry point)
class FuelNowApp extends StatelessWidget {
  const FuelNowApp({super.key});

  // First screen the user sees is the LoginScreen
  // No UI is drawn yet, flutter is building a widget tree
  // Walks the tree down, call build on every widget, creates desc of UI
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FuelNow',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF121212),
        colorScheme: const ColorScheme.dark(
          primary: Colors.deepOrange,
          secondary: Colors.orangeAccent,
        ),
      ),
      home: const LoginScreen(),
    );
  }
}
