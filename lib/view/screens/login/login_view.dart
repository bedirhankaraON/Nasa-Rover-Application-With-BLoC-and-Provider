import 'package:flutter/material.dart';
import 'package:nasa_application/core/services/exporter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(logo),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Welcome To Nasa!",
                style: h1,
              ),
            ),
            CupertinoButton.filled(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Icon(Icons.facebook),
                    ),
                    Text('Login with Facebook'),
                  ],
                ),
                onPressed: () {
                  AuthService().signInWithFacebook();
                }),
          ],
        ),
      ),
    );
  }
}
