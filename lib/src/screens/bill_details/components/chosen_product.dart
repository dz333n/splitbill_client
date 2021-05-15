import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:splitbill_client/src/models/chosen_product.dart';
import 'package:splitbill_client/src/screens/bill_details/components/product_description.dart';
import 'package:splitbill_client/src/screens/bill_details/components/take_part_button.dart';

typedef void OnCoefficientChange(double coefficient);

class ChosenProductCard extends HookWidget {
  final ChosenProduct chosenProduct;
  final OnCoefficientChange onCoefficientChange;

  ChosenProductCard({
    @required this.chosenProduct,
    @required this.onCoefficientChange,
  });

  static final _padding = const EdgeInsets.only(
    top: 16.0,
    left: 16.0,
    right: 16.0,
    bottom: 0.0,
  );

  @override
  Widget build(BuildContext context) {
    final coefficient = chosenProduct.coefficient;
    final product = chosenProduct.product;

    return Card(
      child: Padding(
        padding: _padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductDescription(product),
            if (coefficient != null) Text(coefficient.toStringAsPrecision(2)),
            Center(
              child: TakePartButton(
                onTap: () => this.onCoefficientChange(1),
              ),
            )
          ],
        ),
      ),
    );
  }
}
