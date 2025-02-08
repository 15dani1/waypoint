import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'; // For Padding and other helpers
import 'auth_service.dart';
import 'home_page.dart';
import 'signup_page.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  String? _errorMessage;

  // Login function
  Future<void> _login() async {
    final user = await _authService.loginWithEmail(
      _emailController.text.trim(),
      _passwordController.text.trim(),
    );

    if (user != null) {
      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(builder: (_) => HomePage()),
      );
    } else {
      setState(() {
        _errorMessage = "Invalid email or password";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Login'),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CupertinoTextField(
                controller: _emailController,
                placeholder: 'Email',
                keyboardType: TextInputType.emailAddress,
                padding: EdgeInsets.all(12),
              ),
              CupertinoTextField(
                controller: _passwordController,
                placeholder: 'Password',
                obscureText: true,
                padding: EdgeInsets.all(12),
              ),
              if (_errorMessage != null)
                Text(
                  _errorMessage!,
                  style: TextStyle(color: CupertinoColors.destructiveRed),
                ),
              CupertinoButton.filled(
                onPressed: _login,
                child: Text('Log In'),
              ),
              CupertinoButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (_) => SignUpPage()),
                  );
                },
                child: Text("Sign up"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
