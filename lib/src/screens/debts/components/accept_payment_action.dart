import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:splitbill_client/src/components/utils/async_button.dart';

class AcceptPaymentAction extends HookWidget {
  final double initialAmount;

  AcceptPaymentAction(this.initialAmount);

  @override
  Widget build(BuildContext context) {
    final amountState = useState(initialAmount);

    onAccept() async {
      await Future.delayed(const Duration(seconds: 2));
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

  AmountField({@required this.amount, @required this.onAmountChange});

  @override
  Widget build(BuildContext context) {
    return TextField(
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
