import 'package:flutter/material.dart';
import 'package:splitbill_client/src/models/chosen_product.dart';
import 'package:splitbill_client/src/screens/bill_details/components/chosen_product.dart';
import 'package:splitbill_client/src/screens/bill_details/components/no_chosen_products.dart';

typedef void OnCoefficientChange(
    ChosenProduct chosenProduct, double coefficient);

class ChosenProductsList extends StatelessWidget {
  final List<ChosenProduct> chosenProducts;
  final OnCoefficientChange onCoefficientChange;

  ChosenProductsList({
    @required this.chosenProducts,
    @required this.onCoefficientChange,
  });

  @override
  Widget build(BuildContext context) {
    if (chosenProducts.isEmpty) {
      return NoChosenProducts();
    }

    return ListView.builder(
      itemCount: chosenProducts.length,
      itemBuilder: (BuildContext context, int index) {
        final chosenProduct = chosenProducts[index];

        return ChosenProductCard(
          chosenProduct: chosenProduct,
          onCoefficientChange: (double coefficient) =>
              this.onCoefficientChange(chosenProduct, coefficient),
        );
      },
    );
  }
}
