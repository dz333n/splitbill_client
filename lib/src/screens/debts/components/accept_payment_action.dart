import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:splitbill_client/src/components/utils/async_button.dart';
import 'package:splitbill_client/src/services/split_bill_api/split_bill_api.dart';
import 'package:splitbill_client/src/models/debt.dart';

class AcceptPaymentAction extends HookWidget {
  final Debt debt;

  AcceptPaymentAction(this.debt);

  @override
  Widget build(BuildContext context) {
    final amountState = useState(debt.money);

    onAccept() async {
      await client.createTransaction(
        Debt(
          money: amountState.value,
          sender: debt.recipient,
        ),
      );
    }

    return Container(
      height: 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            child: AmountField(
              amount: amountState.value,
              onAmountChange: (amount) => amountState.value = amount,
            ),
          ),
          SizedBox(width: 16.0),
          Flexible(
            flex: 1,
            child: AsyncButton(
              operation: onAccept,
              child: Text(
                "Accept payment",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}

typedef void OnAmountChange(double amount);

class AmountField extends StatelessWidget {
  final double amount;
  final OnAmountChange onAmountChange;
  final TextEditingController controller;

  AmountField({@required this.amount, @required this.onAmountChange})
      : this.controller = TextEditingController()..text = amount.toString();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: "Amount",
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(),
        ),
      ),
      keyboardType: TextInputType.number,
      onChanged: (value) => onAmountChange(double.parse(value)),
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
    );
  }
}
