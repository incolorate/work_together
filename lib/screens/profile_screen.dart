import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileScreen extends StatelessWidget {
  final User user;

  const ProfileScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.orange,
            child: Text(
              user.displayName?.substring(0, 1).toUpperCase() ??
              user.email?.substring(0, 1).toUpperCase() ??
              'U',
              style: const TextStyle(fontSize: 40, color: Colors.white),
            ),
          ),
          const SizedBox(height: 20),
          const Text('Profile Screen', style: TextStyle(fontSize: 24)),
          const SizedBox(height: 20),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Email: ${user.email ?? 'Not provided'}'),
                  const SizedBox(height: 8),
                  Text('Display Name: ${user.displayName ?? 'Not set'}'),
                  const SizedBox(height: 8),
                  Text('User ID: ${user.uid}'),
                  const SizedBox(height: 8),
                  Text('Email Verified: ${user.emailVerified ? 'Yes' : 'No'}'),
                  const SizedBox(height: 8),
                  Text('Account Created: ${user.metadata.creationTime?.toString() ?? 'Unknown'}'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
