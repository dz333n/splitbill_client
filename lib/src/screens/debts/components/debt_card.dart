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

    final spacer = const SizedBox(width: 8);

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
            child: Container(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: UserAvatar(user: recipient, size: 60),
                    ),
                  ),
                  spacer,
                  Flexible(
                    flex: 3,
                    child: Container(
                      width: double.infinity,
                      child: Text(recipient.name),
                    ),
                  ),
                  spacer,
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
          ),
        ],
      ),
    );
  }

  bool get isPositive => debt.money > 0;
  Color get textColor => isPositive ? Colors.green : Colors.red;
  String get symbol => isPositive ? "📈" : "📉";
}
