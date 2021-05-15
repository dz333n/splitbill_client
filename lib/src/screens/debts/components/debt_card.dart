import 'package:flutter/material.dart';
import 'package:splitbill_client/src/models/debt.dart';
import 'package:splitbill_client/src/screens/debts/components/debt_info.dart';

class DebtCard extends StatelessWidget {
  final Debt debt;

  DebtCard(this.debt);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              left: 4,
              right: 4.0,
            ),
            child: DebtInfo(debt),
          ),
        ],
      ),
    );
  }
}
