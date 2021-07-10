import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:splitbill_client/src/models/chosen_product.dart';
import 'package:splitbill_client/src/screens/bill_details/components/factor_button.dart';
import 'package:splitbill_client/src/screens/bill_details/components/product_description.dart';

typedef void OnCoefficientChange(double? coefficient);

class ChosenProductCard extends HookWidget {
  final ChosenProduct chosenProduct;
  final OnCoefficientChange onCoefficientChange;

  ChosenProductCard({
    required this.chosenProduct,
    required this.onCoefficientChange,
  });

  static final _padding = const EdgeInsets.all(16.0);

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
            SizedBox(height: 16.0),
            FactorButton(
              coefficient: coefficient,
              onCoefficientChange: onCoefficientChange,
            ),
          ],
        ),
      ),
    );
  }
}
