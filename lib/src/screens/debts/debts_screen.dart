import 'package:flutter/material.dart';
import 'package:splitbill_client/src/screens/debts/components/body.dart';

class DebtsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Debts")),
      body: DebtsScreenBody(),
    );
  }
}
