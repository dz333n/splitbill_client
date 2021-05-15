import 'package:flutter/material.dart';
import 'package:splitbill_client/src/models/debt.dart';
import 'package:splitbill_client/src/screens/debts/components/accept_payment_action.dart';
import 'package:splitbill_client/src/screens/debts/components/debt_info.dart';

class DebtCard extends StatelessWidget {
  final Debt debt;
  final OnAccept onAccept;

  DebtCard({
    @required this.debt,
    @required this.onAccept,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DebtInfo(debt),
            SizedBox(height: 12.0),
            AcceptPaymentAction(
              debt: debt,
              onAccept: onAccept,
            ),
          ],
        ),
      ),
    );
  }
}
