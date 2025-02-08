import 'package:flutter/cupertino.dart';
import 'auth_service.dart';
import 'home_page.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  String? _errorMessage;

  // Sign Up function
  Future<void> _signUp() async {
    final user = await _authService.signUpWithEmail(
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
        _errorMessage = "Error signing up";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Sign Up'),
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
                onPressed: _signUp,
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
