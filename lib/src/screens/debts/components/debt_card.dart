import 'package:flutter/material.dart';
import 'package:splitbill_client/src/components/users/user_avatar.dart';
import 'package:splitbill_client/src/models/debt.dart';

class DebtCard extends StatelessWidget {
  final Debt debt;

  DebtCard(this.debt);

  @override
  Widget build(BuildContext context) {
    final money = debt.money;
    final recipient = debt.recipient;

    return ListTile(
      leading: AspectRatio(
        aspectRatio: 1,
        child: UserAvatar(user: recipient, size: 45),
      ),
      title: Text(recipient.name),
      trailing: Text(
        "${money.toString()} $symbol",
        style: TextStyle(
          color: textColor,
        ),
      ),
    );
  }

  bool get isPositive => debt.money > 0;
  Color get textColor => isPositive ? Colors.green : Colors.red;
  String get symbol => isPositive ? "📈" : "📉";
}
