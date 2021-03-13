import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:splitbill_client/src/application.dart';

void main() {
  Application.init();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: Application.router.generator,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
