import 'package:flutter/material.dart';
import 'package:splitbill_client/src/models/debt.dart';
import 'package:splitbill_client/src/components/users/user_avatar.dart';

class DebtInfo extends StatelessWidget {
  final Debt debt;

  DebtInfo(this.debt);

  bool get isPositive => debt.money > 0;
  Color get textColor => isPositive ? Colors.green : Colors.red;
  String get symbol => isPositive ? "📈" : "📉";

  @override
  Widget build(BuildContext context) {
    final money = debt.money;
    final recipient = debt.recipient;

    final spacer = const SizedBox(width: 8);

    return Container(
      height: 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            child: AspectRatio(
              aspectRatio: 1,
              child: UserAvatar(user: recipient!, size: 60),
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
    );
  }
}
