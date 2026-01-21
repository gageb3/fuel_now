import 'package:flutter/material.dart';

// SignUpScreen is immutable, does not store user data
// Job is only to exist in widget tree, create associated State
class SignUpScreen extends StatefulWidget {
  // Never changes, aka immutable configuration
  const SignUpScreen({super.key});

  // Flutter calls this once when screen is inserted
  // State object holds mutable data, trigger rebuilds
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

// State responsible for deciding when UI updates
class _SignUpScreenState extends State<SignUpScreen> {
  // Temporary UI state, holds what user types, lives only while screen exists.
  String email = '';
  String password = '';

  // Called when screen appears and setState is called.
  // Describes UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Text never changes, flutter can cache, improves performance
            const Text(
              'Create Account',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 24),

            // Email input
            TextField(
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            // Password input
            TextField(
              obscureText: true,
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 24),

            // Create account button (logic comes next)
            SizedBox(
              width: double.infinity, // Forces full width
              child: ElevatedButton(
                onPressed: () {
                  // Placeholder for signup logic
                  Navigator.pop(context);
                },
                child: const Text('Create Account'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
