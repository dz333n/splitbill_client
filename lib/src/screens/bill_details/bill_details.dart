import 'package:flutter/material.dart';
import 'package:splitbill_client/src/screens/bill_details/components/body.dart';

class BillDetailsScreen extends StatelessWidget {
  final int billId;

  BillDetailsScreen(this.billId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bill details"),
      ),
      body: BillDetailsScreenBody(billId),
    );
  }
}
