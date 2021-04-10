import 'package:flutter/material.dart';
import 'package:splitbill_client/src/screens/login/components/login_form.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Spacer(flex: 3),
            Text("Sign in"),
            Spacer(),
            Container(
              padding: const EdgeInsets.only(left: 32.0, right: 32.0),
              child: LoginForm(),
            ),
            Spacer(flex: 4),
          ],
        ),
      ),
    );
  }
}
