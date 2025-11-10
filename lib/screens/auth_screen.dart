import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authService = AuthService();
  bool _isSignUp = false;
  bool _isLoading = false;

  void _showSnackBar(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    }
  }

  Future<void> _submit() async {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      _showSnackBar('Please fill in all fields');
      return;
    }

    setState(() => _isLoading = true);

    try {
      if (_isSignUp) {
        await _authService.signUp(
          _emailController.text.trim(),
          _passwordController.text,
        );
      } else {
        await _authService.signIn(
          _emailController.text.trim(),
          _passwordController.text,
        );
      }
      // Success - user will be automatically redirected by AuthWrapper
    } catch (e) {
      _showSnackBar(e.toString());
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isSignUp ? 'Sign Up' : 'Sign In'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _submit,
                child: _isLoading
                  ? const CircularProgressIndicator()
                  : Text(_isSignUp ? 'Sign Up' : 'Sign In'),
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () => setState(() => _isSignUp = !_isSignUp),
              child: Text(_isSignUp
                ? 'Already have an account? Sign In'
                : 'Need an account? Sign Up'),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () async {
                if (_emailController.text.isEmpty) {
                  _showSnackBar('Please enter your email first');
                  return;
                }
                try {
                  await _authService.resetPassword(_emailController.text.trim());
                  _showSnackBar('Password reset email sent!');
                } catch (e) {
                  _showSnackBar('Error: ${e.toString()}');
                }
              },
              child: const Text('Forgot Password?'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
