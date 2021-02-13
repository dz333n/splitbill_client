import 'package:flutter/material.dart';
import 'package:splitbill_client/src/application.dart';
import 'package:splitbill_client/src/screens/login/login_screen.dart';

void main() {
  Application.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Text('Application'),
    );
  }
}
