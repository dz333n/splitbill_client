import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:splitbill_client/src/components/utils/async_button.dart';
import 'package:splitbill_client/src/models/debt.dart';

typedef Future OnAccept(double amount, Debt debt);

class AcceptPaymentAction extends HookWidget {
  final Debt debt;
  final OnAccept onAccept;

  AcceptPaymentAction({
    @required this.debt,
    @required this.onAccept,
  });

  @override
  Widget build(BuildContext context) {
    final amountState = useState(debt.money);

    return Container(
      height: 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            child: AmountField(
              initialAmount: debt.money,
              onAmountChange: (amount) => amountState.value = amount,
            ),
          ),
          SizedBox(width: 16.0),
          Flexible(
            flex: 1,
            child: AsyncButton(
              operation: () => onAccept(amountState.value, debt),
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

class AmountField extends HookWidget {
  final double initialAmount;
  final OnAmountChange onAmountChange;

  AmountField({@required this.initialAmount, @required this.onAmountChange});

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController(text: initialAmount.toString());

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
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      onChanged: (value) => onAmountChange(double.parse(value)),
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?[,.]?\d{0,2}')),
      ],
    );
  }
}
