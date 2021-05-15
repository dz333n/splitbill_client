import 'package:flutter/material.dart';
import 'package:splitbill_client/src/components/users/user_avatar.dart';
import 'package:splitbill_client/src/models/debt.dart';
import 'package:splitbill_client/src/screens/debts/components/accept_payment_action.dart';

class DebtCard extends StatelessWidget {
  final Debt debt;

  DebtCard(this.debt);

  @override
  Widget build(BuildContext context) {
    final money = debt.money;
    final recipient = debt.recipient;

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 1,
                  child: AspectRatio(
                    aspectRatio: 2,
                    child: UserAvatar(user: recipient, size: 60),
                  ),
                ),
                Flexible(flex: 4, child: Text(recipient.name)),
                Flexible(
                  flex: 2,
                  child: Text(
                    "${money.toString()} $symbol",
                    style: TextStyle(
                      color: textColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool get isPositive => debt.money > 0;
  Color get textColor => isPositive ? Colors.green : Colors.red;
  String get symbol => isPositive ? "📈" : "📉";
}
