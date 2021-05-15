import 'package:flutter/material.dart';

typedef void OnCoefficientChange(double coefficient);

class FactorButton extends StatelessWidget {
  final double coefficient;
  final OnCoefficientChange onCoefficientChange;

  FactorButton({
    @required this.coefficient,
    @required this.onCoefficientChange,
  });

  @override
  Widget build(BuildContext context) {
    if (coefficient == null) {
      return _buildInitialButton();
    }

    return _buildFactorModifiers();
  }

  Widget _buildInitialButton() {
    return Row(children: [
      Expanded(
        child: OutlinedButton(
          onPressed: () => {
            onCoefficientChange(1),
          },
          child: Text("Wow, that's mine 🍕"),
        ),
      )
    ]);
  }

  Widget _buildFactorModifiers() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: change(-0.5),
        ),
        Text(coefficient.toString()),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: change(0.5),
        ),
      ],
    );
  }

  change(offset) {
    return () {
      double newCoefficient = coefficient + offset;
      if (newCoefficient == 0) {
        newCoefficient = null;
      }
      onCoefficientChange(newCoefficient);
    };
  }
}
