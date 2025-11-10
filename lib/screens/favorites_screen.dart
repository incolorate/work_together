import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FavoritesScreen extends StatelessWidget {
  final User user;

  const FavoritesScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.favorite, size: 100, color: Colors.red),
          SizedBox(height: 20),
          Text('Favorites Screen', style: TextStyle(fontSize: 24)),
          Text('Your favorite items'),
        ],
      ),
    );
  }
}
