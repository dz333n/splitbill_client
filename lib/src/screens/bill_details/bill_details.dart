import 'package:flutter/material.dart';

class BillDetailsScreen extends StatelessWidget {
  final int billId;

  BillDetailsScreen(this.billId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bill details"),
      ),
      body: Text("Bill details"),
    );
  }
}
