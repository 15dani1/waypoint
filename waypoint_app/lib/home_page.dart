import 'package:flutter/cupertino.dart';
import 'auth_service.dart';
import 'login_page.dart';

class HomePage extends StatelessWidget {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Home'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () async {
            await _authService.signOut();
            Navigator.pushReplacement(
              context,
              CupertinoPageRoute(builder: (_) => LoginPage()),
            );
          },
          child: Icon(CupertinoIcons.square_arrow_right),
        ),
      ),
      child: SafeArea(
        child: Center(
          child: Text(
            'Welcome to the Home Page!',
            style: CupertinoTheme.of(context).textTheme.textStyle,
          ),
        ),
      ),
    );
  }
}
