import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatelessWidget {
  final User user;

  const HomeScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.home, size: 100, color: Colors.blue),
            const SizedBox(height: 20),
            const Text('Home Screen', style: TextStyle(fontSize: 24)),
            Text('Welcome back, ${user.displayName ?? user.email ?? 'User'}!'),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
