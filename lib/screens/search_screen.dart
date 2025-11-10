import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SearchScreen extends StatelessWidget {
  final User user;

  const SearchScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search, size: 100, color: Colors.green),
          SizedBox(height: 20),
          Text('Search Screen', style: TextStyle(fontSize: 24)),
          Text('Find what you need'),
        ],
      ),
    );
  }
}
